#!/usr/bin/env python

import subprocess
import glob
from collections import OrderedDict

HARTRE_TO_KJOULE_MOL = 2625.501969282066 


windows = sorted([folder.strip('/') for folder in glob.glob('*.*/')])
windows = ['0.00',] + windows

for window in windows:
    if window == '0.00':
        continue
    cmd =  "grep 'high  system:  model' {0}/all_lambda*log".format(window)
    output = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True).communicate()[0]
    energies_dict = OrderedDict()
    calc_windows = []
    for line in output.strip().split('\n'):
        calc_window = line.split("_")[2]
        energy = float(line.split()[-1])*HARTRE_TO_KJOULE_MOL
        try:
            energies_dict[calc_window].append(energy)
        except KeyError:
            energies_dict[calc_window] = [energy, ]


    output_filename = "xvg/dhdl_{0}.xvg".format(window)
    output_file = open(output_filename, 'w')

    # bigg hack TODO
    header =\
"""# Amber FEP energy data extracted from file prod-1-0.05-Vf.out                  
#                                                                               
# Multiple Found XYZ messages in the following are ok                           
# Found timestep = 0.001 fs                                                     
# Found timestep = 0.00100 fs                                                   
# Found lambda = 0.0100                                                         
# Found bar_intervall = 100 steps                                               
# Found total of 10 l-values                                                    
# This output file is assumed to be number    1 of 10                           
@ s1 legend dH/d\\xl\\f{} tot-lambda = 0                                          
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.100)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.200)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.300)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.400)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.500)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.600)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.700)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.800)                                         
@ s3 legend \\xD\\f{}H \\xl\\f{} to (0.900) 
@ s3 legend \\xD\\f{}H \\xl\\f{} to (1.000) 
"""

    output_file.write(header)

    for point, _ in enumerate(energies_dict[window]):
        line  = "{0:12.4f}".format(point)
        #line += "{0:14.6f}".format(0)
        for calc_window in windows:
            try:
                energy = energies_dict[calc_window][point] - energies_dict[window][point]
                line += "{0:16.6e}".format(energy)
            except KeyError:
                line += "{0:16.6e}".format(0)
        line += "{0:16.6e}".format(1)
        line += "\n"

        output_file.write(line)

    output_file.close()







