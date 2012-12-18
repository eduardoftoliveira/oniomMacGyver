#!/usr/bin/env python3

# python modules
import sys
import os

# qt modules
from gaussian import GaussianCom
from molecules import Molecule


try:
    gaussian_com_filename = sys.argv[1]
    new_folder_name = sys.argv[2]
except:
    print("Usage: residel <gaussian_input> <folder_to_put_files>")
    sys.exit()

if not os.path.exists("./{}".format(new_folder_name)):
    os.makedirs(new_folder_name)


gaussian_file = GaussianCom(gaussian_com_filename)
atoms_list = gaussian_file.atoms_list
residues_list = Molecule("protein", atoms_list).make_residues_list()


for no, residue in enumerate(residues_list):
    print(no)
    incomplete_residues_list = residues_list[:]
    incomplete_residues_list.remove(residue)
    new_atoms_list = []
    for res in incomplete_residues_list:
        new_atoms_list.extend(res)
    gaussian_file.atoms_list = new_atoms_list
    gaussian_file.redo_connectivity_list()
    # correct link atom number
    for atom in new_atoms_list:
        if atom.link_bound_to:
            if atoms_list.index(atom) > atoms_list.index(residue[0]):
                atom.link_bound_to = str(int(atom.link_bound_to) - len(residue))
    #correct charge
    new_protein = Molecule("new_protein", new_atoms_list)
    charge = sum([res.charge() for res in incomplete_residues_list])
    if residue == residues_list[0] or residue == residues_list[-1]:
        charge -= 1
    gaussian_file.multiplicity_line = "{0} {1}\n".format(int(round(charge))," ".join(gaussian_file.multiplicity_line.split()[1:]))
    
    gaussian_name  = gaussian_com_filename[:-4]
    gaussian_file.write_to_file("{0}/{1}_res_{2}.com".format(new_folder_name, gaussian_name, no+1))

    




