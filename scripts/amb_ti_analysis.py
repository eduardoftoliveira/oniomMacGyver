#!/usr/bin/python
"""Reads the output of a amber TI calculation and plots and calculates
the TI energy"""

import argparse
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import os
import sys
from uncertainties import ufloat
from itertools import izip

## qt modules
from omg.misc import grep2list

PARSER = argparse.ArgumentParser(
    description="""Reads the output files of Amber TI calculations """
                """and calcules the TI energy""",
    formatter_class=argparse.RawTextHelpFormatter)

PARSER.add_argument('prefix',
                    help='prefix of amber ti output files')

PARSER.add_argument('sufix',
                    help='sufix of amber ti output files')

PARSER.add_argument('--mbar', action='store_true',
                    help="calculates mbar energy with alchemical-analysis.py")

PARSER.add_argument('-r',
                    help="""range to analise in each file. """
                         """Three numbers: init end step.""",
                    nargs=3,
                    type=int,
                    default=[0, -3, 1])

ARGS = PARSER.parse_args()
PREFIX = ARGS.prefix
SUFIX = ARGS.sufix
POINTS_RANGE = ARGS.r
MBAR = ARGS.mbar

def main():
    """Reads the output of a amber TI calculation and plots and calculates
the TI energy"""
    amber_out_files = sorted([f  for f in os.listdir('.')
                              if f.startswith(PREFIX) and f.endswith(SUFIX)])

    ## this should be divided into functions
    dvdl_values = []
    error_values = []
    lambda_values = []
    no_points_values = []
    mbar_folder = "xvg"
    if MBAR:
        if not os.path.exists(mbar_folder):
            os.makedirs(mbar_folder)
        for amber_out_file in amber_out_files:
            xvg_name = "{0}.xvg".format(
                    amber_out_file.replace(PREFIX,"dhdl.").replace(SUFIX,""))
            os.system("amb_ti_mbar_prepare_data.pl {0} > {1}/{2}".format(
                amber_out_file, mbar_folder, xvg_name))
        print("alchemical_analysis.py -u kcal -g -w "                          
                        "-m bar+dexp+iexp+mbar -i 0 > mbar_energies")
        os.system("cd {0}; alchemical_analysis.py -u kcal -g -w "
            "-m bar+dexp+iexp+mbar -i 0 > mbar_energies; cd ..".format(mbar_folder))

        with open("{0}/results.txt".format(mbar_folder), 'r') as mbar_file:
            mbar_file.readline()
            methods = []
            energies = []
            for word in  mbar_file.readline().split():
                if word not in ["States", "(kcal/mol)"]:
                    methods.append(word)
                    energies.append([])
            mbar_file.readline()
            for line in mbar_file:
                if line.startswith("----"):
                    break
                else:
                    numbers = line.split()[3:]
                    for i in range(0, len(numbers), 3):
                        energies[i/3].append(numbers[i])
        

        for no, mbar_values in enumerate(energies):
            arr_mbar = np.array([0] + mbar_values +[0],dtype=float)
            arr_mbar[0] = arr_mbar[1] - (arr_mbar[2] - arr_mbar[1])
            arr_mbar[-1] = arr_mbar[-2] + (arr_mbar[-2] - arr_mbar[-3])
            mbar_total = sum(arr_mbar)
            print methods[no], mbar_total 



    for amber_output_file in amber_out_files:
        lambda_v = float(amber_output_file[len(PREFIX):-len(SUFIX)])
        dvdls = grep2list('DV/DL  =', amber_output_file, 2, np_array=True)
        dvdls = dvdls[POINTS_RANGE[0]:POINTS_RANGE[1]:POINTS_RANGE[2]]
        no_points = len(dvdls)
        print ".",
        sys.stdout.flush()

        ## clambda_values,alculate this dvdl and append do dvdl_values
        lambda_values.append(lambda_v)
        dvdl_values.append(np.average(dvdls))
        no_points_values.append(no_points)
        #plt.plot(dvdls)
        #plt.show()

        ## calculate error
        block_sizes = [no_points/n for n in range(1, len(dvdls)+1)
                       if no_points % n == 0]

        block_stdev_corrs = []
        for block_size in block_sizes:
            block_averages = []
            for start in range(0, no_points, block_size):
                mini_array = dvdls[start:start+block_size]
                block_averages.append(np.average(mini_array))
            block_stdev_corrs.append(
                np.std(block_averages)/np.sqrt(no_points/block_size))

        error_values.append(max(block_stdev_corrs))
        #plt.plot(np.log10(block_sizes),block_stdev_corrs)
        #plt.show()

    # sort these by lambda
    lambda_values, dvdl_values, no_points_values = izip(*sorted(izip(
        lambda_values, dvdl_values, no_points_values)))

    lambda_values = list(lambda_values)
    dvdl_values = list(dvdl_values)
    no_points_values = list(no_points_values)


    #extrapolate Gdata for lambda 0 (linearly from neighboring two points)
    if lambda_values[0] != 0:
        dvdl_mi = (dvdl_values[1] - dvdl_values[0])/(
            lambda_values[1]-lambda_values[0])
        dvdl_zero = dvdl_values[0] - dvdl_mi * lambda_values[0]
        lambda_values.insert(0, 0)
        dvdl_values.insert(0, dvdl_zero)
        error_values.insert(0, error_values[0])

    #extrapolate data for lambda 1 (linearly from neighboring two points)
    if lambda_values[-1] != 1:
        dvdl_mf = (dvdl_values[-1] - dvdl_values[-2]) /\
                  (lambda_values[-1]-lambda_values[-2])
        dvdl_one = dvdl_values[-1] + dvdl_mf * (1 -lambda_values[-1])
        lambda_values.append(1)
        dvdl_values.append(dvdl_one)
        error_values.append(error_values[-1])

    no_points_values.insert(0, "extrapolated")
    no_points_values.append("extrapolated")
    no_points_values = [str(x) for x in no_points_values]

    # calculation error
    udvdl_values = np.array([ufloat(dvdl_values[i], error_values[i])
                             for i in range(len(lambda_values))])
    udvdl_integration = np.trapz(udvdl_values, x=lambda_values)

    print
    print "Energies in kcal/mol"
    print " lambda   dvdl     block SEM    no of points"

    for i, lambda_v in enumerate(lambda_values):
        print "{0:6.2f}{1:10.3f}{2:10.2f}{3:>18s}"\
         .format(lambda_v, dvdl_values[i], error_values[i], no_points_values[i])

    dvdl_values = np.array(dvdl_values)
    error_values = np.array(error_values)
    lambda_values = np.array(lambda_values)
    plt.plot(lambda_values, dvdl_values, 'bo')
    plt.plot(lambda_values, dvdl_values, 'b')
    plt.plot(lambda_values, dvdl_values+error_values, 'r')
    plt.plot(lambda_values, dvdl_values-error_values, 'r')
    plt.fill_between(lambda_values, 0, dvdl_values, alpha=0.5)
    plt.legend(["{0} kcal/mol".format(udvdl_integration)], loc=3)
    plt.savefig("ti.png", dpi=300)
    print " Total{0.n:10.3f}{0.s:10.2f}".format(udvdl_integration)


if __name__ == '__main__':
    main()
