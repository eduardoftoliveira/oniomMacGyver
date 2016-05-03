#!/usr/bin/env python

import glob
import numpy as np
import subprocess
import sys
import copy


#constants
HARTREE_TO_KJOULE_MOL = 2625.501969282066 

END_R = 77

def main():
    results_filename = sys.argv[1]
    #energies_matrix = np.matrix(np.array(shape=(no_points, no_points)))
    windows = []
    with open(results_filename, 'r') as results_file:
        for line in results_file:
            window = int(line.split('/')[0])
            calc_window = int(line.split('/')[1].split('_')[0])
            if window == calc_window:
                windows.append(window)
    n_steps = max(windows)+1
    n_frames = windows.count(windows[2])
    energies_3d = np.zeros(shape=(n_steps,n_steps, n_frames))
    print energies_3d.shape
    with open(results_filename, 'r') as results_file:
        for line in results_file:
            window = int(line.split('/')[0])
            calc_window = int(line.split('/')[1].split('_')[0])
            frame = int(line.split('_')[3].split('.')[0])
            energy = line.split()[5]
            energy = float(energy)*HARTREE_TO_KJOULE_MOL
            energies_3d[window][calc_window][frame] = energy

    #reversion
    r_energies_3d = copy.deepcopy(energies_3d)
    for i in range(END_R):
        for j in range(END_R):
            r_energies_3d[i][j] = energies_3d[END_R - i -1][END_R - j -1]
    r_energies_3d[END_R+1][END_R] = np.zeros(n_frames)
    r_energies_3d[END_R][END_R+1] = np.zeros(n_frames)
    #for n_window, _ in enumerate(energies_3d):



    #subtraction 
    for n_window, _ in enumerate(r_energies_3d):
        these_energies = copy.deepcopy(r_energies_3d[n_window][n_window])
        for n_calc, _ in enumerate(r_energies_3d[n_window]):
            if r_energies_3d[n_window][n_calc][0] != 0:
                r_energies_3d[n_window][n_calc] = r_energies_3d[n_window][n_calc] -\
                    these_energies

    # print
    for n_window, window in enumerate(energies_3d):
        output_filename = "xvg/dhdl.{0:03d}.xvg".format(n_window)
        output_file = open(output_filename, 'w')
        for frame in range(n_frames):
            line  = "{0:12.4f}".format(frame)
            line += "{0:14.6f}".format(0)
            for n_calc in range(n_steps):
                line += "{0:16.6e}".format(r_energies_3d[n_window][n_calc][frame])
            #line += "{0:16.6e}".format(1)
            line += "\n"

            output_file.write(line)

        output_file.close()

if __name__ == "__main__":
    main()





