#!/usr/bin/env python3

# python modules
import sys
import os
import copy

# qt modules
from gaussian import GaussianCom, GaussianLog
from molecules import Molecule
from elements_database import ATOMIC_NUMBER_DICT

try:
    reactants_folder = sys.argv[1]
    ts_folder = sys.argv[2]
    original_ts_energy = float(sys.argv[3])
except:
    print("Usage: residel_energies.py <reactants_folder> <ts_folder> <ts_energy>")
    sys.exit()
    
for reactants_filename in os.listdir(reactants_folder):
    if reactants_filename.endswith(".log"):
        try:
            reactants_energy = GaussianLog("{0}/{1}"\
            .format(reactants_folder,reactants_filename)).energies_list[-1][-1]
        except IndexError:
            reactants_energy = None

        try:
            ts_filenames = os.listdir(ts_folder)
            ts_filename_end = "_".join(reactants_filename.split("_")[-2:])
            ts_filename = ts_folder+"_"+ts_filename_end
            ts_energy = GaussianLog("{0}/{1}"\
                   .format(ts_folder,ts_filename)).energies_list[-1][-1]
        except IndexError:
            ts_energy = None

        if reactants_energy and ts_energy:
            print(ts_filename_end[:-4],original_ts_energy-(ts_energy-reactants_energy)*627.5095)
