#!/usr/bin/env python3


import sys
from gaussian import GaussianCom, GaussianLog
import math

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

for input_file in input_file_list:
    print(input_file)
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
            print("{0:>3}{2[0]:<4}-{1:>3}{2[1]:<4}        :   {3:7.3f}".format(atom_a,atom_b,pair,this_dist))
        elif len(pair) == 3:
           atom_c = structure[pair[2]-1]
           this_angle = atom_b.angle(atom_a, atom_c)
           this_angle = math.degrees(this_angle)
           print("{0:>3}{3[0]:<4}-{1:>3}{3[1]:<4}-{2:>3}{3[2]:<4}:   {4:7.3f}".format(atom_a,atom_b,atom_c,pair,this_angle))


#angle
#cos-1((P122 + P132 - P232)/(2 * P12 * P13))


