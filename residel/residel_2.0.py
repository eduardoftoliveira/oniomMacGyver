#!/usr/bin/env python3

# python modules
import sys
import os
import copy

# qt modules
from gaussian import GaussianCom
from molecules import Molecule
from elements_database import ATOMIC_NUMBER_DICT

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

input_list = []
for no, residue in enumerate(residues_list):
    residue_number_name = "{0.residue_number}_{0.residue_name}".format(residue[0])
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
        if atom.link_bound_to:
            if atoms_list.index(atom) > atoms_list.index(residue[0]):
                new_atom = copy.deepcopy(atom)
                new_atom.link_bound_to = str(int(new_atom.link_bound_to) - len(residue))
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
        run_script.write("g09 {0}\n".format(job))



