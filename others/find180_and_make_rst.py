#!/usr/bin/python3


import gaussian
import math
import sys

MAX_ANGLE = 178
MAX_DISTANCE = 4.5

gaussian_name = sys.argv[1] 
gaussian_com_name = gaussian_name +'.com'
gaussian_log_name = gaussian_name + '.log'
new_gaussian_com_name = gaussian_name + '_rst.com'

gaussian_file = gaussian.GaussianLog(gaussian_log_name)
log_atoms_list = gaussian_file.final_geometry

new_lines = []
for no1, atom_1 in enumerate(log_atoms_list):
    if atom_1.layer == 'H' or atom_1.link_element:
        for no2, atom_2 in enumerate(log_atoms_list[no1+1:]):
            if atom_1.distance(atom_2) < MAX_DISTANCE and (atom_2.layer == 'H' or atom_2.link_element):
                for no3, atom_3 in enumerate(log_atoms_list[no1+no2+2:]):
                    if atom_2.distance(atom_3) < MAX_DISTANCE and \
                        atom_1.distance(atom_3) < MAX_DISTANCE and  \
                            (atom_3.layer == 'H' or atom_3.link_element):
                        
                        angle_1 = 180/math.pi*atom_1.angle(atom_2, atom_3)
                        angle_2 = 180/math.pi*atom_2.angle(atom_1, atom_3)
                        angle_3 = 180/math.pi*atom_3.angle(atom_1, atom_2)
                        if angle_1 > MAX_ANGLE:
                            print("{:6.2f} {} {} {}: A {} {} {} K".format(
                                angle_1, atom_2, atom_1, atom_3, no2+no1+2, no1+1,no3+no2+no1+3 ))
                            new_lines.append("A {} {} {} K\n".format(no2+no1+2, no1+1,no3+no2+no1+3))
                        if angle_2 > MAX_ANGLE:
                            print("{:6.2f} {} {} {}: A {} {} {} K".format(angle_2,atom_2,atom_1,atom_3, no1+1,no2+no1+2, no3+no2+no1+3))
                            new_lines.append("A {} {} {} K\n".format(no1+1,no2+no1+2, no3+no2+no1+3)) 
                        if angle_3 > MAX_ANGLE:
                            print("{:6.2f} {} {} {}: A {} {} {} K".format(angle_3,atom_1,atom_3,atom_2,no2+no1+2,no3+no2+no1+3, no1+1) )
                            new_lines.append("A {} {} {} K\n".format(no2+no1+2,no3+no2+no1+3, no1+1))

gaussian_com_file = gaussian.GaussianCom(gaussian_com_name)
gaussian_com_file.atoms_list = log_atoms_list
gaussian_com_file.additional_input_dict['modred'].extend(new_lines)

gaussian_com_file.write_to_file(new_gaussian_com_name)


