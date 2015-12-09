#!/usr/bin/env python

import glob
import subprocess
import sys

from collections import OrderedDict

#constants
HARTREE_TO_KJOULE_MOL = 2625.501969282066 
NO_STEPS = 1000

def main():
    results_filename = sys.argv[1]
    all_info = OrderedDict()
    energies_dict = OrderedDict() 
    with open(results_filename, 'r') as results_file:
        for line in results_file:
            window = line.split('/')[0]
            window = '{:03d}'.format(int(window))
            calc_window = line.split('/')[1].split('_')[0]
            calc_window = '{:03d}'.format(int(calc_window))
            step = line.split('_')[3].split('.')[0]
            step = int(step)
           
            energy = line.split()[5]
            energy = float(energy)*HARTREE_TO_KJOULE_MOL

            if not window in all_info:
                all_info[window] = OrderedDict()
            try:
                all_info[window][calc_window][step]=energy
            except KeyError:
                all_info[window][calc_window] = [None]*1000
                all_info[window][calc_window][step] = energy

    no_points = len(all_info[window][calc_window])

    all_info = OrderedDict(sorted(all_info.items()))
    for window in all_info:
        all_info[window] = OrderedDict(sorted(all_info[window].items()))

    for window in all_info:
        output_filename = "xvg/dhdl.{0}.xvg".format(window)
        output_file = open(output_filename, 'w')
        
        for point in range(no_points):
            line  = "{0:12.4f}".format(point)
            line += "{0:14.6f}".format(0)
            for calc_window in all_info:
                try:
                    energy = all_info[window][calc_window][point] - all_info[window][window][point]
                    line += "{0:16.6e}".format(energy)
                except KeyError:
                    line += "{0:16.6e}".format(0)
            line += "{0:16.6e}".format(1)
            line += "\n"

            output_file.write(line)

        output_file.close()

if __name__ == "__main__":
    main()





