#!/usr/bin/env python

# qt modules
from omg import atoms

# (1)Parsing and (2)Printing
# Gaussian Z-MAT Line 
# PDB

def _extract_resinfo(line):
    """extract (PDBName=x,ResName=y,ResNum=0) from rest of line"""
    if '(' in line and ')' in line:
        resinfo = line.split('(')[1].split(')')[0]
        line = line.split('(')[0] + line.split(')')[1]
    else:
        resinfo = None
    return line, resinfo

def _parse_resinfo(resinfo):
    """interpret (PDBName=x,ResName=y,ResNum=0)"""
    name, resname, resnum, chain = '', '', '', '' 
    for info in resinfo.split(','):
        if 'PDBName' in info:
            name = info.split("=")[1].strip()
        if 'ResName' in info:
            resname = info.split("=")[1].strip()
        if 'ResNum' in info:
            resnum = info.split("=")[1].strip()
            if '_' in resnum : # looks like "123_A"
                resnum, chain = resnum.split("_")
            resnum = int(resnum) # TODO Will crash if ""
    return atoms.RESinfo(name, resname, resnum, chain)

def _parse_xyz_line(line_splited):
    (el, x, y, z) = line_splited
    el, mm_obj = _parse_mm_info(el)
    atom = atoms.Atom(el, (float(x), float(y), float(z)))
    if mm_obj:
        atom.set_mm(mm_obj)
    return atom

def _parse_mm_info(mm_info):
    """
    standard:       H-HC--0.02
    no charge:      H-HC        # force charge = 0.0
    just element    H           # mm_obj = None
    """
    splits = mm_info.split('-',2)
    element = splits[0]
    if len(splits) == 3:
        mm_obj = atoms.MM(splits[1], float(splits[2]))
    elif len(splits) == 2 and type(splits[1]) == str:
        mm_obj = atoms.MM(splits[1], 0.0)
    elif len(splits) == 1:
        mm_obj = None
    else:
        raise RuntimeError('Cannot parse: %s' % mm_info)
    return element, mm_obj

def _parse_oniom_line(line_splits):
    """C-CT--0.2      0  1.000 1.100 1.200 L H-HC 123 0.0"""
    mm_info, mask, x, y, z, temp = line_splits[0:6]
    layer, link_splits = temp[0], temp[1:].split()
    # create atom and MM_obj
    el, mm_obj = _parse_mm_info(mm_info)
    atom = atoms.Atom(el, (float(x), float(y), float(z)))
    if mm_obj: 
        atom.set_mm(mm_obj) # high layer atoms might not have it
    # create Oniom object
    oniom_obj = atoms.Oniom(int(mask), layer)
    # process link atom
    if len(link_splits) == 1:
        raise RuntimeError('missing bound_to in link atom: %s' % (
            ' '.join(link_splits)))
    elif len(link_splits) > 1:
        link_splits.append('0.0')  # HAMMERATION
        link_mm_info, bound_to, scale1 = link_splits[:3]
        link_el, link_mm_obj = _parse_mm_info(link_mm_info)
        link_atom = atoms.Atom(link_el, (0, 0, 0)) # empty coords
        if link_mm_obj:
            link_atom.set_mm(link_mm_obj)
        oniom_obj.set_link(link_atom, int(bound_to), float(scale1))
    # add oniom_obj
    atom.set_oniom(oniom_obj)
    return atom

def zmat2atom(line):
    (line, resinfo) = _extract_resinfo(line)
    line_splits = line.strip().split(None, 5)
    # gen oniom atom
    if len(line_splits) == 6:
        atom = _parse_oniom_line(line_splits)
    # gen xyz atom
    elif len(line_splits)==4:
        atom = _parse_xyz_line(line_splits)
    # unknown
    elif len(line_splits) not in [4,6]:  
        raise RuntimeError('Expected 4 or 6 fields in zmat line')
    # add resinfo if present
    if resinfo:
        resinfo_obj = _parse_resinfo(resinfo)
        atom.set_resinfo(resinfo_obj)
    return atom

        
def atom2zmat(atom, print_resinfo = True):

    # check attributes
    res = atom.resinfo and print_resinfo

    # el + mm + resinfo
    if atom.mm:
        line = '{0}-{1.mm.atype}-{1.mm.charge:.9f}'.format(atom.GetType(),atom)
        line = '{0:.15s}'.format(line) # fill with spaces (max 15 char)
    else:
        line = ' {0:1s}'.format(atom.GetType()) #NOTA:provavelment vai ser preciso adicionar 14s apos a resinfo 

    if res:
        line = ('{0}(PDBName={1.resinfo.name},'
        'ResName={1.resinfo.resname},'
        'ResNum={1.resinfo.resnum}_{1.resinfo.chain})'
        .format(line, atom))
        line = '{0:60s}'.format(line) # fill with spaces

    # add:  mask + (x, y, z) + layer
    if atom.oniom:
        line += (
        '{0.oniom.mask:>4d} {1:>11.6f} {2:>11.6f} '
        '{3:>11.6f} {0.oniom.layer:s}'
        .format(atom,
                atom.GetX(),
                atom.GetY(),
                atom.GetZ(),
               ))

        # add link
        if atom.oniom.has_link:
            link_atom = atom.oniom.link_atom
            if link_atom.mm:
                line += (
                ' {0}-{1.mm.atype}-{1.mm.charge}'
                ' {2.oniom.link_bound_to} {2.oniom.link_scale1}'
                .format(link_atom.GetType(), link_atom, atom))
            else:
                line += (
                ' {0}'
                ' {1.oniom.link_bound_to} {1.oniom.link_scale1}'
                .format(link_atom.GetType(), atom))

    # add (x, y, z)
    else:
        line += '{0:>11.6f} {1:>11.6f} {2:>11.6f}'.format(atom.x(),
                                                          atom.y(),
                                                          atom.z())
    
    line = "{0}\n".format(line)

    return line


def atom2pdb(atom):
    if atom.pdbinfo == None:
        atom.set_pdbinfo( atoms.PDBinfo('ATOM', 0) )
    if not atom.resinfo:
        line =(
        '{1.keyword:<6s}          {1.altloc:1s}' 
        '         {1.icode:1s}'
        '   {2:8.3f}{3:8.3f}{4:8.3f}'
        '{1.occupancy:6.2f}{1.bfact:6.2f}'
        '          {5:>2s}{1.formalcharge:2s}\n'
        .format(atom, atom.pdbinfo, atom.x(), atom.y(), atom.z(),
                atom.GetType()))
        return line
    else:
        line =(
        '{2.keyword:<6s}{2.serial:>5d} {1.name:4s}{2.altloc:1s}' 
        '{1.resname:3s} {1.chain:1s}{3:4d}{2.icode:1s}'
        '   {4:8.3f}{5:8.3f}{6:8.3f}'
        '{2.occupancy:6.2f}{2.bfact:6.2f}'
        '          {7:>2s}{2.formalcharge:2s}\n'
        .format(atom, atom.resinfo, atom.pdbinfo, atom.resinfo.resnum%10000,
            atom.GetX(), atom.GetY(), atom.GetZ(), atom.GetType()))
    return line

def atom2pdbqt(atom):
    if not atom.resinfo:
        line =(
        '{1.keyword:<6s}          {1.altloc:1s}' 
        '         {1.icode:1s}'
        '   {2:8.3f}{3:8.3f}{4:8.3f}'
        '{1.occupancy:6.2f}{1.bfact:6.2f}'
        '  {0.mm.charge:8.3f} {0.mm.atype:2s}\n'
        .format(atom, atom.pdbinfo, atom.x(), atom.y(), atom.z()))
        return line
    else:
        line =(
        '{2.keyword:<6s}{2.serial:>5d} {1.name:4s}{2.altloc:1s}' 
        '{1.resname:3s} {1.chain:1s}{3:4d}{2.icode:1s}'
        '   {4:8.3f}{5:8.3f}{6:8.3f}'
        '{2.occupancy:6.2f}{2.bfact:6.2f}'
        '  {0.mm.charge:8.3f} {0.mm.atype:2s}\n'
        .format(atom, atom.resinfo, atom.pdbinfo, atom.resinfo.resnum%10000,
            atom.GetX(), atom.GetY(), atom.GetZ()))
    return line

def spaceint(a_string):
    if a_string.strip() == '':
        return 0
    else:
        return int(a_string)

def spacefloat(a_string):
    if a_string.strip() == '':
        return 0.0
    else:
        return float(a_string)

def pdb2atom(line):
    # start atom
    el = line      [76:78].strip()
    if el == '':
        el = ''.join(i for i in line[12:16].strip() if not i.isdigit())[0] #get from atom name
                                                                    #after eliminating numbers
    x  = float(line[30:38])
    y  = float(line[38:46])
    z  = float(line[46:54])
    atom = atoms.Atom(el, (x,y,z))

    # residue info
    name        = line      [12:16].strip()     # atom name
    resName     = line      [17:20].strip()     # Residue name
    resNum      = spaceint(line[22:26])    # Residue number
    chain       = line      [21:22].strip()     # chain
    resinfo = atoms.RESinfo(name, resName, resNum, chain)

    # pdb info
    keyword   = line[ 0: 6]     
    serial    = spaceint(line[ 6:11]) 
    pdbinfo = atoms.PDBinfo(keyword, serial, 
        occupancy   = spacefloat(line[54:60]),
        bfact       = spacefloat(line[60:66]),
        altloc      = line[16:17],
        icode       = line[26:27],
        formalcharge = line[78:80].strip())

    # return
    atom.set_resinfo(resinfo)
    atom.set_pdbinfo(pdbinfo)
    return atom

def pdbqt2atom(line):
    # start atom
    atype = line[77:79].strip()
    x  = float(line[30:38])
    y  = float(line[38:46])
    z  = float(line[46:54])
    ad2el = {'H':'H', 'HD':'H', 'HS':'H', 'C':'C', 'A':'C', 'N':'N', 'NA':'N',
        'NS':'N', 'OA':'O', 'OS':'O', 'F':'F', 'Mg':'Mg', 'MG':'Mg', 'P':'P',
        'SA':'S', 'S':'S', 'Cl':'Cl', 'CL':'Cl', 'Ca':'Ca', 'CA':'Ca',
        'Mn':'Mn', 'MN':'Mn', 'Fe':'Fe', 'FE':'Fe', 'Zn':'Zn', 'ZN':'Zn',
        'Br':'Br', 'BR':'Br', 'I':'I', 'W':'O'} 
    atom = atoms.Atom(ad2el[atype], (x,y,z))

    # residue info
    name        = line      [12:16].strip()     # atom name
    resName     = line      [17:20].strip()     # Residue name
    resNum      = spaceint(line[22:26])    # Residue number
    chain       = line      [21:22].strip()     # chain
    resinfo = atoms.RESinfo(name, resName, resNum, chain)

    # pdb info
    keyword   = line[ 0: 6]     
    serial    = spaceint(line[ 6:11]) 
    pdbinfo = atoms.PDBinfo(keyword, serial, 
        occupancy   = spacefloat(line[54:60]),
        bfact       = spacefloat(line[60:66]),
        altloc      = line[16:17],
        icode       = line[26:27],
        formalcharge = '  ')

    # atype, charge
    mm = atoms.MM(atype, float(line[70:76]))

    # return
    atom.set_mm(mm)
    atom.set_resinfo(resinfo)
    atom.set_pdbinfo(pdbinfo)
    return atom

def mol22atom(line):
    "Reads a mol2 atom line and returns the atoms indexes and bond order"
    """ex:\
    '      1 O1         -0.5240   -0.4910   -0.1630 os        1 MOL     -0.196235\n'
    """
    words = line.strip().split()

    # basic atom info
    element = words[5].split('.')[0]
    x, y, z = words[2:5]
    
    # mm info
    atom_type = words[1]
    if len(words) == 9:
        charge = words[8]
        name = words[1]
        atom_type = words[5] #changes the info of the atom_type if mol2 has
                             # 9 fields
    else:
        charge = None

    atom = atoms.Atom(atom_type,(float(x), float(y), float(z)))
    mm_obj = atoms.MM(atom_type, charge)
    atom.set_mm(mm_obj)

    #resinfo if mol2 has 9 fields
    if len(words) == 9:
        resinfo_obj = atoms.RESinfo(name, words[7], words[6], 'X')
        atom.set_resinfo(resinfo_obj)

    return atom


def mol22bond(line):
    "Reads a mol2 bond line and returns the corresponding bond object"
    bond_order_dict = {'1':1, '2':2, '3':3, 
                       'ar':1.5, 'Ar':1.5, 'Am':1.5, 'am':1.5}
    words = line.strip().split()
    return int(words[1]), int(words[2]), bond_order_dict[words[3]]

def bonds2lines( atoms_list, bonds_list ):
    """vou fazer um teste aqui para a partir de uma molecule.bond imprimir\
    uma linha de bond tipo a que se encontra no mol2 (1 1 2 ar) """
    """i dont know why but the conectivity list created in omg.mol2 has the \
            atom connected to himself - now i think its corrected"""
    not_duplicated_bonds = []
    connectivity_text = []
    for bond in bonds_list:
        if bond.atom_a is bond.atom_b:
            continue
        elif bond.order == 1.5:
            bond.order = 'ar'
        for atom_idx, atom in enumerate(atoms_list):
            if atom is bond.atom_a:
                atom_a_idx = atom_idx
            elif atom is bond.atom_b:
                atom_b_idx = atom_idx

        not_duplicated_bonds.append(bond)
        line = " {0} {1} {2} {3} \n".format( len(not_duplicated_bonds),
            atom_a_idx+1,
            atom_b_idx+1, 
            bond.order)
        connectivity_text.append(line)
    return connectivity_text


