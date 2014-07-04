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
            resnum = int(resnum)
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
    elif len(link_splits) == 2:
        link_splits.append('0.0')
    elif len(link_splits) >2:
        link_mm_info, bound_to, scale1 = link_splits[:3]
        link_el, link_mm_obj = _parse_mm_info(link_mm_info)
        link_atom = atoms.Atom(link_el, (None, None, None)) # empty coords
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
    mm  = hasattr(atom, 'mm')
    res = hasattr(atom, 'resinfo') and print_resinfo

    # el + mm + resinfo
    if mm and res:
        line = (
        ' {0.element}-{0.mm.atype}-{0.mm.charge:.9f}'
        '(PDBName={0.resinfo.name},'
        'ResName={0.resinfo.resname},'
        'ResNum={0.resinfo.resnum}_{0.resinfo.chain})'
        .format(atom))
        line = '{0:44s}'.format(line) # fill with spaces

    # el
    elif (not mm) and (not res):
        line = ' {0.element:15s}'.format(atom)

    # el + mm
    elif mm and (not res):
        line = '{0.element}-{0.mm.atype}-{0.mm.charge:.9f}'.format(atom)
        line = '{0:.15s}'.format(line) # fill with spaces (max 15 char)

    # el + resinfo
    elif (not mm) and res:
        line = (
        ' {0.element}'
        '(PDBName={0.resinfo.name},'
        'ResName={0.resinfo.resname},'
        'ResNum={0.resinfo.resnum}_{0.resinfo.chain})'
        .format(atom))
        line = '{0:44s}'.format(line) # fill with spaces

    # add:  mask + (x, y, z) + layer
    if hasattr(atom, 'oniom'):
        line += (
        '{0.oniom.mask:>4d} {0.x:>11.6f} {0.y:>11.6f} '
        '{0.z:>11.6f} {0.oniom.layer:s}'
        .format(atom))

        # add link
        if atom.oniom.has_link:
            link_atom = atom.oniom.link_atom
            if hasattr(link_atom, 'mm'):
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


