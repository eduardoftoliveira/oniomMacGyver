#!/usr/bin/env python

from os.path import splitext
from os import path
import sys
import subprocess
from omg.gaussian.gaussian import GaussianCom as GAUCOM
from omg import atoms, iolines, geom
import getopt, math
import bhtree
import numpy as np

def min_dist(setA, setB, CUTOFF = 8.0):
    bht = bhtree.bhtreelib.BHtree(setB, None, 10)
    indx = np.zeros(len(setB)).astype('i')
    mindist = float('+inf')
    for a in setA:
        dist = np.ones(len(setB)).astype('f')*9999
        bht.closePointsDist2(tuple(a), CUTOFF, indx, dist)
        mindist = min(dist.min(), mindist)
    bhtree.freeBHtree(bht) # or memory builds up
    return math.sqrt(mindist) 

def usage():
    print('usage:')
    print('  gau_freezecom.py gaussian_input.com')
    print('options:')
    print('  -f (float)     dist to freeze      [default: do not freeze]')
    print('  -o (string)    new gau input       [default: input + .frost.com]')
    print('  -w             freeze low WAT      [default: no freeze]')
    print('  -d (float)     dist 2 del WAT      [default: -1]')
    print('  -m (int)       oniom mask          [default: -1]')
    print('  --keep (int)   del all but N WAT   [keeps N closest waters]')

def get_resID(atom):
    return (atom.resinfo.resname, atom.resinfo.resnum)

def build_resID_dict(atoms_list): 
    d = {}
    for (i, at) in enumerate(atoms_list):
        resID = get_resID(at)
        if resID not in d:
            d[resID] = []
        d[resID].append(i)
    return d

def byres(resID_dict, mask_vec):
    """if one false, all false"""
    for resID in resID_dict:
        if False in [mask_vec[i] for i in resID_dict[resID]]:
            for i in resID_dict[resID]:
                mask_vec[i] = False
    return mask_vec

def byresTrue(resID_dict, mask_vec):
    """if one True, all True (for del wat)"""
    for resID in resID_dict:
        if True in [mask_vec[i] for i in resID_dict[resID]]:
            for i in resID_dict[resID]:
                mask_vec[i] = True
    return mask_vec

def write_pdb(filename, atoms_list):
    with open(filename, 'w') as o:
        for (i, atom) in enumerate(atoms_list):
            o.write(iolines.atom2pdb(atom))


def main():
    
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], 'f:o:m:wd:', ['keep='])
    except getopt.GetoptError as err:
        sys.stderr.write(err + '\n')
        usage()
        sys.exit(2)
    
    if len(args) < 1:
        usage()
        print('missing:')
        print('  gaussian_input.com')
        sys.exit(2)
    elif len(args) > 1:
        usage()
        print('too many args:')
        print('  %s' % (','.join(args)))
    
    filein = args[0]
    basename, input_extension = splitext(filein)
    if input_extension != '.com':
        print('WARNING:')
        print('  inputname suffix is: %s' % input_extension)
    
    # defaults
    outputname = basename + '.frost.com'
    freeze_angs = False
    freeze_mm_wat = False
    del_wat_angs = False
    keep_N_wat = False
    MASK = -1
    
    # provided input
    for o, a in opts:
        if o == '-f':   freeze_angs = float(a)
        elif o == '-o': outputname = a 
        elif o == '-w': freeze_mm_wat = True
        elif o == '-m': MASK = int(a)
        elif o == '-d': del_wat_angs = float(a)
        elif o == '--keep': keep_N_wat = int(a)
    
    # input
    gaucom = GAUCOM(filein)
    resID_dict = build_resID_dict(gaucom.atoms_list)


    # get xyz tuples
    highlayer_xyz = []
    all_xyz = []
    non_wat_xyz = []
    for i,atom in enumerate(gaucom.atoms_list):
        if atom.oniom.layer == 'H':
            highlayer_xyz.append((atom.GetX(), atom.GetY(), atom.GetZ()))
        if not atom.resinfo.resname == 'WAT' or atom.oniom.layer == 'H':
            non_wat_xyz.append((atom.GetX(), atom.GetY(), atom.GetZ()))
        all_xyz.append((atom.GetX(), atom.GetY(), atom.GetZ()))

    if not len(highlayer_xyz) and freeze_angs:
        print('WELL WELL...')
        print('     no highlayer defined, freezing nothing')
        sys.exit()
    elif freeze_angs == False:
        freeze_idx = [False for _ in all_xyz]        
        if freeze_mm_wat:
            for (i,xyz) in enumerate(all_xyz):
                atom = gaucom.atoms_list[i]
                freeze_idx[i] = (atom.oniom.layer=='L' and
                    atom.resinfo.resname=='WAT')
    else:
        # indexes to freeze
        CUTOFF = freeze_angs + 1.0
        freeze_idx = [False for _ in all_xyz]
        for (i,xyz) in enumerate(all_xyz):
            atom = gaucom.atoms_list[i]
            tofreeze = min_dist( [xyz] , highlayer_xyz, CUTOFF) >= freeze_angs
            tofreeze = tofreeze or (freeze_mm_wat and 
                atom.oniom.layer=='L' and atom.resinfo.resname=='WAT')
            freeze_idx[i] = tofreeze


    # byres
    freeze_idx = byres(resID_dict, freeze_idx)

    # freeze now
    for (i, at) in enumerate(gaucom.atoms_list):
        if freeze_idx[i]:
            at.oniom.mask = MASK


    # delete waters?
    del_idx = [False for _ in all_xyz]
    if del_wat_angs:
        CUTOFF = del_wat_angs + 1.0
        for (i,xyz) in enumerate(all_xyz):
            atom = gaucom.atoms_list[i]
            del_idx[i] = (
                (min_dist([xyz], highlayer_xyz, CUTOFF) <= del_wat_angs) and
                (atom.resinfo.resname == 'WAT') and
                (atom.oniom.layer == 'L')
                         )
        del_idx = byresTrue(resID_dict, del_idx)

    if keep_N_wat:
        dists = []
        for resID in resID_dict:
            if resID[0] == 'WAT':
                waters = [gaucom.atoms_list[i] for i in resID_dict[resID]]
                if 'H' not in [a.oniom.layer for a in waters]:
                    xyz = [(atom.GetX(), atom.GetY(), atom.GetZ()) for a in waters]
                    dists.append((resID, min_dist(xyz, non_wat_xyz)))
            if (i+1)%1001 == 0:
                print(i)
        dists.sort(key=lambda x: x[1])

        # update del_idx
        for (resID, dist) in dists[keep_N_wat:]:
            for i in resID_dict[resID]:
                del_idx[i] = True
        

    if keep_N_wat or del_wat_angs:

        del_idx = byres(resID_dict, del_idx)
        print('Deleted atoms: %d' % (del_idx.count(True)))

        # delete atoms
        new_atoms_list = []
        deleted = []
        for (i,atom) in enumerate(gaucom.atoms_list):
            if not del_idx[i]:
                new_atoms_list.append(atom)
            else:
                atom.set_pdbinfo(atoms.PDBinfo('ATOM', i))
                atom.pdbinfo.altloc = atom.oniom.layer
                deleted.append(atom)

        # write pdb with deleted atoms
        write_pdb('%s.delwat.pdb' % (outputname), deleted)
        

        # update atoms list
        gaucom.atoms_list = new_atoms_list
        gaucom.redo_connectivity_list() # works for TS structures?
        
    # print pdb copy of model by mask
    topdb_dict = {}
    for (i,atom) in enumerate(gaucom.atoms_list):
        mask = atom.oniom.mask
        atom.set_pdbinfo(atoms.PDBinfo('ATOM', i))
        atom.pdbinfo.altloc = atom.oniom.layer
        if mask not in topdb_dict:
            topdb_dict[mask] = []
        topdb_dict[mask].append(atom)

    for mask in topdb_dict:
        write_pdb('%s.%d.pdb' % (outputname, mask), topdb_dict[mask])

    # write output
    gaucom.write_to_file(outputname)

    return 0

#yeah
main()



