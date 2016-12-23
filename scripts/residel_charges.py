#!/usr/bin/env python

# python modules
import sys
import os
import numpy as np
import math

# qt modules
from omg.gaussian.gaussian import GaussianCom
from omg.molecules import Molecule

# autodock
import bhtree

def usage():
    print('usage:')
    print('  residel_charges.py gaussian_input.com')
    print('                 dist to delete      [always: 15 Angstroms ]')
    print('                 new_folder_name     [always: argv[1]/ ]')


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


def zerate_res_charge(atomslist, (resname,resid) ):
    """for a list of residues, changes all atoms charge to 0"""
    """criar outra funcao que mediante o residuo da o indice dos atomos e aqui altero so esses indices """
    original_charges = []
    for atomo in atomslist:
        if atomo.resinfo.resname==resname and atomo.resinfo.resnum==resid:
            original_charges.append(atomo.mm.charge)
            atomo.mm.charge = 0
    return original_charges

def reset_res_charge(atomslist, (resname, resid), original_charges):
    i = 0
    for a in atomslist:
        if a.resinfo.resname == resname and a.resinfo.resnum == resid:
            a.mm.charge = original_charges[i]
            i += 1
    return None


def main():

    gaussian_com_filename = sys.argv[1] 
    new_folder_name = os.path.splitext(sys.argv[1])[0]
    freeze_angs = 15 

    if not os.path.exists("./{}".format(new_folder_name)):
        os.makedirs(new_folder_name)

    # input
    gaussian_file = GaussianCom(gaussian_com_filename)
    resID_dict = build_resID_dict(gaussian_file.atoms_list)

    # get xyz tuples
    highlayer_xyz = []
    all_xyz = []
    non_wat_xyz = []   #all MM and non waters
    for i,atom in enumerate(gaussian_file.atoms_list):
        if atom.oniom.layer == 'H':
            highlayer_xyz.append((atom.GetX(), atom.GetY(), atom.GetZ()))
        if not atom.resinfo.resname == 'WAT' or atom.oniom.layer == 'H':
            non_wat_xyz.append((atom.GetX(), atom.GetY(), atom.GetZ()))
        all_xyz.append((atom.GetX(), atom.GetY(), atom.GetZ()))

    if not len(highlayer_xyz):
        print('WELL WELL...')
        print('     no highlayer defined, freezing nothing')
    else:
    # indexes to freeze [list of atoms to "freeze"]
        CUTOFF = freeze_angs + 1.0
        freeze_idx = [False for _ in all_xyz]
        for (i,xyz) in enumerate(all_xyz):
            atom = gaussian_file.atoms_list[i]
            tofreeze = min_dist( [xyz] , highlayer_xyz, CUTOFF) <= freeze_angs
            freeze_idx[i] = tofreeze
            if atom.resinfo.resname == 'WAT' or atom.oniom.layer == 'H':
                freeze_idx[i] = False

        # byres - returns the same freeze_idx list, but if at least one atom is true, then changes all to True
        freeze_idx = byres(resID_dict, freeze_idx)

    # residue selection [list of tuples (resn, resid)]
    res_2_go = list(set(get_resID(gaussian_file.atoms_list[i]) for i in np.where(freeze_idx)[0])) 

    old_atoms_list = gaussian_file.atoms_list
    residues_list = Molecule("protein", old_atoms_list).make_residues_list()

    # do the magic
    for no, residue in enumerate(residues_list):
        if get_resID(residue[0]) not in res_2_go:
            continue
        
        #NOTA: a lista de residues (residue[0]) parece uma [lista de residues[lista atoms]] devo conseguir descompactar isto
        resname = residue[0].resinfo.resname
        resid = residue[0].resinfo.resnum
        residue_number_name = "{0}_{1}".format(resname,resid)

        original_charges = zerate_res_charge(old_atoms_list, (resname, resid))
        
        #print(residue_number_name)

        gaussian_name  = "{0}_{1}.com".format(
            gaussian_com_filename[:-4],
            residue_number_name
        )
        gaussian_file.write_to_file("{0}/{1}".format(
            new_folder_name,
            gaussian_name)
        )
        reset_res_charge(old_atoms_list, (resname, resid), original_charges)
#        input_list.append(gaussian_name)
    
#    script_file_name = "{0}/{1}".format(new_folder_name,"run.sh")
#    with open(script_file_name, 'w') as run_script:
#        for job in input_list:
#            out_name = job[:-4]+".log"
#            run_script.write("g09 {0} {1}\n".format(job,out_name))
#

main()
