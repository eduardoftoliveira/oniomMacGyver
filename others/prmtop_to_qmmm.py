#!/usr/bin/env python3


import sys 
from amber import read_prmtop_charges, read_amber_atom_type_list
from gaussian import GaussianCom

try:
    prmtop_filename = sys.argv[1]
    gaussian_filename_in = sys.argv[2]
    gaussian_filename_out = sys.argv[3]
except IndexError:
    print("Usage: prmtop_to_qmmm.py <prmtop_filename> <gaussian_com_initial> <gaussian_com_final>")
    sys.exit()

prmtop_charges_list = read_prmtop_charges(prmtop_filename)
prmtop_atom_type_list = read_amber_atom_type_list(prmtop_filename)

gaussian_file_in = GaussianCom(gaussian_filename_in)

# checking if the number of atoms is the same
if len(prmtop_charges_list) != len(gaussian_file_in.atoms_list):
    print("The prmtop file and gaussian com file do not have the same number of atoms\n")
    sys.exit()

# add or substitute charge and mm_type
for no, atom in enumerate(gaussian_file_in.atoms_list):
    ## some required substituitions
    if prmtop_atom_type_list[no] == "H0":
        prmtop_atom_type_list[no] = "H1"
    
    atom.charge = prmtop_charges_list[no]
    atom.mm_type = prmtop_atom_type_list[no]

gaussian_file_in.write_to_file(gaussian_filename_out)
