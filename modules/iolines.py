#!/usr/bin/env python3

import atoms

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
    elif len(line_list) not in [4,6]:  
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
        line = '{0.element}-{0.mm.atype}-{0.mm.charge:.9f}'.format(atom)
        line = '{0:.15s}'.format(line) # fill with spaces (max 15 char)
    else:
        line = ' {0.element:15s}'.format(atom)

    if res:
        line = ('{0}(PDBName={1.resinfo.name},'
        'ResName={1.resinfo.resname},'
        'ResNum={1.resinfo.resnum}_{1.resinfo.chain})'
        .format(line, atom))
        line = '{0:60s}'.format(line) # fill with spaces

    # add:  mask + (x, y, z) + layer
    if atom.oniom:
        line += (
        '{0.oniom.mask:>4d} {0.x:>11.6f} {0.y:>11.6f} '
        '{0.z:>11.6f} {0.oniom.layer:s}'
        .format(atom))

        # add link
        if atom.oniom.has_link:
            link_atom = atom.oniom.link_atom
            if link_atom.mm:
                line += (
                ' {0.element}-{0.mm.atype}-{0.mm.charge}'
                ' {1.oniom.link_bound_to} {1.oniom.link_scale1}'
                .format(link_atom, atom))
            else:
                line += (
                ' {0.element}'
                ' {1.oniom.link_bound_to} {1.oniom.link_scale1}'
                .format(link_atom, atom))

    # add (x, y, z)
    else:
        line += '{0.x:>11.6f} {0.y:>11.6f} {0.z:>11.6f}'.format(atom)
    
    line = "{}\n".format(line)

    return line


def atom2pdb(atom):
    if not atom.resinfo:
        line =(
        '{1.keyword:<6s}          {1.altloc:1s}' 
        '         {1.icode:1s}'
        '   {0.x:8.3f}{0.y:8.3f}{0.z:8.3f}'
        '{1.occupancy:6.2f}{1.bfact:6.2f}'
        '          {0.element:2s}{1.formalcharge:2s}\n'
        .format(atom, atom.pdbinfo))
        return line
    else:
        line =(
        '{2.keyword:<6s}{2.serial:>5d} {1.name:4s}{2.altloc:1s}' 
        '{1.resname:3s} {1.chain:1s}{3:4d}{2.icode:1s}'
        '   {0.x:8.3f}{0.y:8.3f}{0.z:8.3f}'
        '{2.occupancy:6.2f}{2.bfact:6.2f}'
        '          {0.element:2s}{2.formalcharge:2s}\n'
        .format(atom, atom.resinfo, atom.pdbinfo, atom.resinfo.resnum%10000))
        return line
