#!/usr/bin/env python

import copy
import numpy as np
import shutil
import sys

import gaussian

GAUCOM = sys.argv[1]

WINDOW_SIZE = 0.1

WINDOWS = np.arange(0.00, 1.01, WINDOW_SIZE)

gaussian_file = gaussian.GaussianCom(GAUCOM)
initial_atoms_list = copy.deepcopy(gaussian_file.atoms_list)
initial_mm_params_list = copy.deepcopy(gaussian_file.MM_external_params)

high_atom_types = set([])
for atom in initial_atoms_list:
    if atom.oniom.layer == 'H':
        high_atom_types.add(atom.mm.atype)

for fade in WINDOWS:
    new_atoms_list = copy.deepcopy(initial_atoms_list) 
    
    # electrostatics
    for atom in new_atoms_list:
        if atom.mm.atype in high_atom_types:
            atom.mm.charge = 0
        else:
            atom.mm.charge *= fade

    # vdw
#    new_mm_params_list = initial_mm_params_list[:]
#    for i, line in enumerate(new_mm_params_list):
#        if 'VDW' in line:
#            _ , atype, radius, depth = line.split() 
#            if atype in high_atom_types:
#                #new_depth = "{0:6.4f}".format((float(depth) * fade))
#                #new_mm_params_list[i] = line.replace(depth, new_depth) 
#                new_radius = "{0:6.4f}".format((float(radius) * radius))
#                new_mm_params_list[i] = line.replace(radius, new_radius) 
#        if 'HrmStr1' in line:
#            break
#
#    gaussian_file.additional_input_dict["first"] = new_mm_params_list

    gaussian_file.atoms_list = new_atoms_list
    OUT_GAUCOM = "lambda_{:1.2f}_{}".format(fade, GAUCOM)
    gaussian_file.write_to_file(OUT_GAUCOM)
    # copy to previous, same, an next
    
    for i in (-1,0,1):
        folder_number = fade+(i*WINDOW_SIZE)
        if 0.0001 < folder_number < 1.000001:
            folder = '../{0:1.2f}/'.format(folder_number)
            #print(folder)
            shutil.copy(OUT_GAUCOM, folder)
    



