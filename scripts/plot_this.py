#!/usr/bin/env python

## python modules
import argparse
from matplotlib import pyplot as plt
import numpy as np
import pylab

## qt modules
from omg.misc import grep2list

PARSER = argparse.ArgumentParser(
        description = """Plots and prints statistical information of values"""
                      """ selected from a file""",
        formatter_class = argparse.ArgumentDefaultsHelpFormatter)

PARSER.add_argument('pattern',
        help = 'pattern to select the lines where the values is',
        type = str)

PARSER.add_argument('filename', 
        help = 'file with the values',
        type = str)

PARSER.add_argument('-p',
        help = "position of the value in the line.",
        default = -1,
        type = int)

PARSER.add_argument('-g',
        help = """matplotlib option to choose the color and type of plot points""",
        default = 'b',
        type = str)

PARSER.add_argument('-r',
        help = """range to analise. Three numbers: init end step.""",
        nargs =3,
        type = int,
        default = [0, None , 1])

PARSER.add_argument('-m',
        help = """Mute. Supress the appearence of the plot""",
        action='store_true',
        )

PARSER.add_argument('-s',
        help = """Save the plot with this filename""",
        default = '',
        )

PARSER.add_argument('--hist',
        help = """Make histogram""",
        action='store_true',
        )

ARGS = PARSER.parse_args()
PATTERN = ARGS.pattern
FILENAME = ARGS.filename
POSITION = ARGS.p
GRAPHTYPE = ARGS.g
POINTS_RANGE = ARGS.r
ISMUTE = ARGS.m
SAVE_FILENAME = ARGS.s
MAKE_HISTOGRAM = ARGS.hist

def main():
    """Plots the selected values and prints some statistics about them"""
    ## fazer um print do comando evocato
    values = grep2list(PATTERN, FILENAME, POSITION, np_array=True)
    print("Read {0} values.".format(len(values)))
    values = values[POINTS_RANGE[0]:POINTS_RANGE[1]:POINTS_RANGE[2]]
    print("Using {0} values.".format(len(values)))
    print("Average = {0}".format(np.average(values)))
    std = np.std(values)
    print("Standard Deviation = {0}".format(std))
    print("Standard Error of the Mean = {0}".format(std/np.sqrt(len(values))))

    if SAVE_FILENAME or not ISMUTE:
        plt.plot(values, GRAPHTYPE)
        if SAVE_FILENAME:
            plt.savefig(SAVE_FILENAME)
        if not ISMUTE:
            plt.show()
    if MAKE_HISTOGRAM:
        pylab.hist(values)
        pylab.show()

if __name__ == '__main__':
    main()
