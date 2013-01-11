#!/usr/bin/env python3


import sys
from gaussian import GaussianCom, GaussianLog
import math
from collections import OrderedDict

distances_filename = sys.argv[1]
#distance_file_example:
#
#2321 2122
#2312 1212

dists = []
with open(distances_filename, 'r') as distances_file:
    for line in distances_file:
        distpair = tuple([int(x) for x in line.split()])
        dists.append(distpair)

input_file_list = sys.argv[2:]   #com files

results_dict = OrderedDict([])



for input_file in input_file_list:
    input_file_no_suf = input_file[:-4]
    results_dict[input_file_no_suf] = []
    #print(input_file)
    if input_file.endswith(".com"):
        gaussian_file = GaussianCom(input_file)
        structure = gaussian_file.atoms_list
    else:
        gaussian_file = GaussianLog(input_file)
        structure = gaussian_file.final_geometry
    for pair in dists:
        atom_a = structure[pair[0]-1]
        atom_b = structure[pair[1]-1]
        this_dist = atom_a.distance(atom_b)
        if len(pair) == 2:
            results_dict[input_file_no_suf].append("{0:7.5f}".format(this_dist))
            #print("{0:>3}{2[0]:<4}-{1:>3}{2[1]:<4}        :   {3:7.3f}".format(atom_a,atom_b,pair,this_dist))
        elif len(pair) == 3:
           atom_c = structure[pair[2]-1]
           this_angle = atom_b.angle(atom_a, atom_c)
           this_angle = math.degrees(this_angle)
           results_dict[input_file_no_suf].append("{0:7.3f}".format(this_dist))

           #print("{0:>3}{3[0]:<4}-{1:>3}{3[1]:<4}-{2:>3}{3[2]:<4}:   {4:7.3f}".format(atom_a,atom_b,atom_c,pair,this_angle))


#angle
#cos-1((P122 + P132 - P232)/(2 * P12 * P13))
###


### PRINT RESULTS
line = ";"
for pair in dists:
    atom_a = structure[pair[0]-1]
    atom_b = structure[pair[1]-1]
    if len(pair) ==2:
        line += "{1}{0[0]}-{2}{0[1]};".format(pair,atom_a,atom_b)

    if len(pair) ==3:
        atom_c = structure[pair[2]-1]
        line += "{1}{0[0]}-{2}{0[1]}-{3}{0[2]};".format(pair,atom_a,atom_b,atom_c)
print(line)

for func_base in results_dict:
    line = func_base + ";"
    for dist in results_dict[func_base]:
        line += dist + ";"
    print(line)

