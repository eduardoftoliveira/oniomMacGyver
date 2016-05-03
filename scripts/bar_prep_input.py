#!/usr/bin/env python

import subprocess
import glob
from collections import OrderedDict

HARTRE_TO_KJOULE_MOL = 2625.501969282066 


windows = sorted([folder.strip('/') for folder in glob.glob('*.*/')])

for window in windows:
    cmd =  "grep 'high  system:  model' {0}/all_lambda*log".format(window)
    output = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True).communicate()[0]
    energies_dict = OrderedDict()
    for line in output.strip().split('\n'):
        calc_window = line.split("_")[2]
        energy = float(line.split()[-1])*HARTRE_TO_KJOULE_MOL
        try:
            energies_dict[calc_window].append(energy)
        except KeyError:
            energies_dict[calc_window] = [energy, ]


    output_filename = "xvg/dhdl_{0}.xvg".format(window)
    output_file = open(output_filename, 'w')

    for point, _ in enumerate(energies_dict[window]):
        line  = "{0:12.4f}".format(point)
        line += "{0:14.6f}".format(0)
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







