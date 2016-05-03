#!/usr/bin/env python

# python modules
import sys
import os
import copy
import getopt
import numpy as np
import math

# qt modules
from gaussian import GaussianCom
from molecules import Molecule
from elements_database import ATOMIC_NUMBER_DICT

# autodock
import bhtree

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
    print('  residel_3.0.py gaussian_input.com')
    print('  -f (float)     dist to delete      [default: 15 Angstroms ]')
    print('  -d (string)    new_folder_name     [default: ./residel/ ]')

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


def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], 'f:d:')
    except getopt.GetoptError as err:
        sys.stderr.write(str(err) + '\n')

    if len(args) < 1:
        usage()
        print('Missing:')
        print('  gaussian_input.com')
        sys.exit(2)
    elif len(args) > 1:
        usage()
        print('Hey! Too many args:')
        print('  %s' % (', '.join(args)))

    gaussian_com_filename = args[0]
    new_folder_name = 'residel'
    freeze_angs = 15

    for o, a in opts:
        if o == '-f':   freeze_angs = float(a)
        if o == '-d':   new_folder_name = a

    if not os.path.exists("./{}".format(new_folder_name)):
        os.makedirs(new_folder_name)

    # input
    gaussian_file = GaussianCom(gaussian_com_filename)
    resID_dict = build_resID_dict(gaussian_file.atoms_list)

    # get xyz tuples
    highlayer_xyz = []
    all_xyz = []
    non_wat_xyz = []
    for i,atom in enumerate(gaussian_file.atoms_list):
        if atom.oniom.layer == 'H':
            highlayer_xyz.append(atom.get_coordinates())
        if not atom.resinfo.resname == 'WAT' or atom.oniom.layer == 'H':
            non_wat_xyz.append(atom.get_coordinates())
        all_xyz.append(atom.get_coordinates())

    if not len(highlayer_xyz):
        print('WELL WELL...')
        print('     no highlayer defined, freezing nothing')
    else:
    # indexes to freeze
        CUTOFF = freeze_angs + 1.0
        freeze_idx = [False for _ in all_xyz]
        for (i,xyz) in enumerate(all_xyz):
            atom = gaussian_file.atoms_list[i]
            tofreeze = min_dist( [xyz] , highlayer_xyz, CUTOFF) <= freeze_angs
            freeze_idx[i] = tofreeze
            if atom.resinfo.resname == 'WAT' or atom.oniom.layer == 'H':
                freeze_idx[i] = False

        # byres
        freeze_idx = byres(resID_dict, freeze_idx)

    # residue selection
    res_2_go = list(set(get_resID(gaussian_file.atoms_list[i]) for i in np.where(freeze_idx)[0])) 

    atoms_list = gaussian_file.atoms_list
    residues_list = Molecule("protein", atoms_list).make_residues_list()
    
    input_list = []
    for no, residue in enumerate(residues_list):
        if get_resID(residue[0]) not in res_2_go:
            continue

        residue_number_name = "{0.resinfo.resnum}_{0.resinfo.resname}".format(residue[0])
        
        print(residue_number_name)
        incomplete_residues_list = Molecule("protein", atoms_list).make_residues_list()
        incomplete_residues_list.remove(residue)
        new_atoms_list = []
        for res in incomplete_residues_list:
            new_atoms_list.extend(res)
        gaussian_file.atoms_list = new_atoms_list
        gaussian_file.redo_connectivity_list()
        no_electrons = 0
        # correct link atom number and count total number of electrons
        for i, atom in enumerate(new_atoms_list):
            no_electrons += ATOMIC_NUMBER_DICT[atom.element]
            if atom.oniom.link_bound_to:
                if int(atom.oniom.link_bound_to) > atoms_list.index(residue[0]):
                    new_atom = copy.deepcopy(atom)
                    new_atom.oniom.link_bound_to = str(int(new_atom.oniom.link_bound_to) - len(residue))
                    new_atoms_list[i] = new_atom
        #correct charge and multiplicity
        new_protein = Molecule("new_protein", new_atoms_list)
        charge = sum([res.charge() for res in incomplete_residues_list])
        no_electrons -= round(charge)
        multiplicity = int(gaussian_file.multiplicity_line.split()[1])
        if (no_electrons%2==0 and multiplicity-1%2!=0) or (no_electrons%2==1 and multiplicity-1%2!=1):
            print("Number of electrons and multiplicity are not compatible. Charge increased arbitrarily by one")
            charge += 1
        gaussian_file.multiplicity_line = "{0} {1}\n".format(int(round(charge))," ".join(gaussian_file.multiplicity_line.split()[1:]))
        gaussian_name  = "{0}_{1}.com".format(gaussian_com_filename[:-4],residue_number_name)
        
        gaussian_file.write_to_file("{0}/{1}".format(new_folder_name, gaussian_name))
        input_list.append(gaussian_name)
    
    script_file_name = "{0}/{1}".format(new_folder_name,"run.sh")
    with open(script_file_name, 'w') as run_script:
        for job in input_list:
            out_name = job[:-4]+".log"
            run_script.write("g09 {0} {1}\n".format(job,out_name))


main()
