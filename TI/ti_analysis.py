#!/usr/bin/python

import argparse
import math
import matplotlib.pyplot as plt
import numpy as np
import os
import subprocess
import sys
import time
from uncertainties import ufloat
from uncertainties import unumpy

## qt modules
from misc import grep2list

PARSER = argparse.ArgumentParser(
        description = """Reads the output files of Amber TI calculations """
        """and calcules the TI energy""",
        formatter_class = argparse.RawTextHelpFormatter)

PARSER.add_argument('prefix',
        help = 'prefix of amber ti output files')

PARSER.add_argument('sufix',
        help = 'sufix of amber ti output files')

ARGS = PARSER.parse_args()                                                      
PREFIX = ARGS.prefix
SUFIX = ARGS.sufix

def main():

    amber_out_files = sorted([ f  for f in os.listdir('.') 
                        if (f.startswith(PREFIX) and f.endswith(SUFIX)) ])
    
    dvdl_values = []
    error_values = []
    lambda_values = []
    no_points_values = []
    for amber_output_file in amber_out_files:
        lambda_v = float(amber_output_file[len(PREFIX):-len(SUFIX)])
        lambda_values.append(lambda_v)
        dvdls = grep2list('DV/DL  =', amber_output_file, 2, np_array=True) 
        dvdls = dvdls[:-3]
        no_points = len(dvdls)
        print ".",
        sys.stdout.flush()
        
        ## calculate this dvdl and append do dvdl_values
        dvdl_values.append(np.average(dvdls))
        no_points_values.append(no_points)
        #plt.plot(dvdls)
        #plt.show()
        
        ## calculate error
        block_sizes = [no_points/n for n in range(1,len(dvdls)+1) 
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
        
    #extrapolate Gdata for lambda 0 (linearly from neighboring two points)
    if lambda_values[0] != 0:
        dvdl_mi = (dvdl_values[1] - dvdl_values[0])/(lambda_values[1]-lambda_values[0])
        dvdl_zero = dvdl_values[0] - dvdl_mi * lambda_values[0]
        lambda_values.insert(0,0)
        dvdl_values.insert(0, dvdl_zero)
        error_values.insert(0, error_values[0])
    
    #extrapolate data for lambda 1 (linearly from neighboring two points)
    if lambda_values[-1] != 1:
        dvdl_mf = (dvdl_values[-1] - dvdl_values[-2])/(lambda_values[-1]-lambda_values[-2])
        dvdl_one = dvdl_values[-1] + dvdl_mf * (1 -lambda_values[-1])
        lambda_values.append(1)
        dvdl_values.append(dvdl_one)
        error_values.append(error_values[-1])
    
    no_points_values.insert(0, "extrapolated")
    no_points_values.append("extrapolated")
    no_points_values = [str(x) for x in no_points_values]

    #integration
    dvdl_integration = np.trapz(dvdl_values,x=lambda_values)
    error_integration = np.trapz(error_values, x=lambda_values)
    
    # calculation error
    udvdl_values = np.array([ufloat(dvdl_values[i], error_values[i]) for i in range(len(lambda_values))])
    udvdl_integration = np.trapz(udvdl_values,x=lambda_values)

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
    plt.fill_between(lambda_values, 0,dvdl_values, alpha=0.5)
    plt.legend(["{0} kcal/mol".format(udvdl_integration)], loc=3)
    plt.savefig("ti.png", dpi=300)
    print " Total{0.n:10.3f}{0.s:10.2f}".format(udvdl_integration)

if __name__ == '__main__':
    main()
