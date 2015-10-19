#!/usr/bin/env python

# python modules
import argparse
import copy
import itertools

# qt modules
import gaussian

PARSER = argparse.ArgumentParser(
    description = "Set vdw/ele parameters of high layer to 0")

PARSER.add_argument('gaucom',
                    help = 'gaussian model file')

ARGS = PARSER.parse_args()

GAUCOM = ARGS.gaucom

gaussian_file = gaussian.GaussianCom(GAUCOM)

high_atom_types = set([])
for atom in gaussian_file.atoms_list:
    if atom.oniom.layer == 'H':
        high_atom_types.add(atom.mm.atype)

## remove all atomic charges
for atom in gaussian_file.atoms_list:
    atom.mm.charge = 0

## save file with same vdw
gaucom_filename = "vdw_real_{0}".format(GAUCOM)
gaussian_file.route_section = "#amber=softonly geom(notest,connectivity)\n"     
gaussian_file.write_to_file(gaucom_filename)                                    

## save file with vdw only on low layer

new_mm_params_list = copy.deepcopy(gaussian_file.MM_external_params)
for i, line in enumerate(new_mm_params_list):
    if 'VDW' in line:
        _ , atype, radius, depth = line.split() 
        if atype in high_atom_types:
            new_depth = "{0:6.4f}".format(0)
            new_mm_params_list[i] = line.replace(depth, new_depth) 

gaussian_file.additional_input_dict["first"] = new_mm_params_list
gaucom_filename = "vdw_low_{0}".format(GAUCOM)
gaussian_file.write_to_file(gaucom_filename)                                    

## save file with vdw only on model system

new_mm_params_list = copy.deepcopy(gaussian_file.MM_external_params)
for i, line in enumerate(new_mm_params_list):
    if 'VDW' in line:
        _ , atype, radius, depth = line.split() 
        if atype not in high_atom_types:
            new_depth = "{0:6.4f}".format(0)
            new_mm_params_list[i] = line.replace(depth, new_depth) 

gaussian_file.additional_input_dict["first"] = new_mm_params_list
gaucom_filename = "vdw_model_{0}".format(GAUCOM)
gaussian_file.write_to_file(gaucom_filename)                                    

