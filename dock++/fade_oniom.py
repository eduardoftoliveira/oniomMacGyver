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
initial_charges = [atom.mm.charge for atom in gaussian_file.atoms_list]

high_atom_types = set([])
for atom in gaussian_file.atoms_list:
    if atom.oniom.layer == 'H':
        high_atom_types.add(atom.mm.atype)

for fade in WINDOWS:
    for no, atom in enumerate(gaussian_file.atoms_list):
        if atom.mm.atype in high_atom_types:
            atom.mm.charge = 0
        else:
            atom.mm.charge = initial_charges[no]*fade


    OUT_GAUCOM = "lambda_{:1.2f}_{}".format(fade, GAUCOM)
    gaussian_file.write_to_file(OUT_GAUCOM)
    
    for i in (-1,0,1):
        folder_number = fade+(i*WINDOW_SIZE)
        if 0.0001 < folder_number < 1.000001:
            folder = '../{0:1.2f}/'.format(folder_number)
            shutil.copy(OUT_GAUCOM, folder)
    



