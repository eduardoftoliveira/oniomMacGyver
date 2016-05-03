#!/usr/bin/env python3

import sys
from gaussian import GaussianCom, GaussianLog
import math
import sys

CUTOFF = 2.5

try:
    atom_number = int(sys.argv[1])
    distances_filename = sys.argv[2]
    gaussian_file = GaussianCom(sys.argv[3])
except:
    print("Usage: create_distances_file <atom_number> <distances_files> <gaussian_example>")
    sys.exit()
    
center_atom = gaussian_file.atoms_list[atom_number-1]
distances_file_lines = []
atoms_considered = []
atoms_list = gaussian_file.atoms_list

for no, atom in enumerate(atoms_list):
    #distances
    if atom.distance(center_atom) < CUTOFF and atom is not center_atom:
        line = "{0} {1}\n".format(atom_number, no+1)
        distances_file_lines.append(line)
        atoms_considered.append(atom)
#angles
for no, atom in enumerate(atoms_considered):
    for other_atom in atoms_considered[no+1:]:
        line = "{0} {1} {2}\n".format(atoms_list.index(atom)+1, atom_number, atoms_list.index(other_atom)+1)
        distances_file_lines.append(line)

with open(distances_filename, 'w') as distances_file:
    for line in distances_file_lines:
        distances_file.write(line)
