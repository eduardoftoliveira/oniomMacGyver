#!/usr/bin/env python

import matplotlib as mpl
from matplotlib import pyplot as plt
import argparse

def add_adiabatic_map_to_axis(axis, style, energies, color):
    """ add single set of energies to plot """

    # Energy horizontal decks
    x = style['START']
    for energy in energies:
        axis.plot([x, x+style['WIDTH']], [energy, energy],
            '-%s' % color, linewidth=2)
        x += style['SPACING']

    # Connect steps
    x = style['START'] 
    for i in range(1, len(energies)):
        x1 = x + style['WIDTH']
        x2 = x + style['SPACING']
        y1 = energies[i-1]
        y2 = energies[i]
        axis.plot([x1, x2], [y1, y2], '-%s' % color)
        x += style['SPACING']

def getargs():
    parser = argparse.ArgumentParser(description="""
        Make plot from user provided energies.
        Can read multiple sets of energies.""",
    formatter_class=argparse.RawTextHelpFormatter
    )
     
    parser.add_argument('-o', '--output',
        default='PES.svg',
        help='File name of output figure')
    parser.add_argument('--dpi',
        default=300, type=int,
        help='Resolution for bitmaps')
    parser.add_argument('-e', '--energies',
        nargs='+', type=float, action='append',
        help='Energies for any number of stationary points')
    parser.add_argument('-l', '--labels', nargs='+',
        help='Name of stationary points')
    parser.add_argument('-c', '--colors', nargs='+',
        help='Color codes')

    args = parser.parse_args()

    # less colors than PES ? add 'k'
    if args.colors:
        missing_colors = len(args.energies) - len(args.colors) 
        missing_colors = (missing_colors > 0) * missing_colors
        args.colors += 'k' * missing_colors

    return args

def makelabels(N):
    """ Make automatic labels: TS1, INT1, TS2, etc.."""

    labels = ['R']
    n_ts = N / 2
    n_i = (N - 2) / 2
    n_i = n_i * (n_i > 0) # becomes zero if negative
    for i in range(n_ts + n_i):
        if i % 2:
            labels.append('INT%d' % (i/2+1))
        else:
            labels.append('TS%d' % (i/2+1))
    if N % 2 and N >= 3:
        labels.append('P')

    return labels
 

def configure_axis_limits(axis, style, energies):

    # Appearance 
    ymin, ymax = float('+inf'), float('-inf')
    maxlen = 0
    for energy_set in energies:
        ymin = min(ymin, min(energy_set))
        ymax = max(ymax, max(energy_set))
        maxlen = max(len(energy_set), maxlen)
    yrange = ymax-ymin
    axis.set_ylim(ymin-0.1*yrange, ymax+0.1*yrange)
    xmax = style['START']*2 + style['WIDTH'] + (maxlen-1)*style['SPACING']
    axis.set_xlim(0, xmax)
    axis.set_xticks([
        style['START']+i*style['SPACING']+style['WIDTH']/2.0 for i in range(maxlen)])

    return maxlen
      
    
def main():

    # get user input
    args = getargs()

    # important style features
    style = {
        'WIDTH'     : 4,    # width of horizontal bars
        'SPACING'   : 10,   # spacing between center of horizontal bars
        'START'     : 3     # x-offset from y-axis
    }

    # Configure Figure
    fig = plt.gcf()
    fig.set_size_inches(3.3, 2.5)
    mpl.rcParams.update({'font.size': 7, 'axes.linewidth':0.5})
    plt.subplots_adjust(bottom=.15)
    plt.subplots_adjust(left=.15)
    plt.ylabel('Energy (kcal/mol)')
    plt.xlabel('Reaction coordinate')
    ax = fig.gca()
    ax.grid(True)
    maxlen = configure_axis_limits(ax, style, args.energies)

    if not args.labels:
        args.labels = makelabels(maxlen)

    ax.set_xticklabels(args.labels)

    # plot stuff
    color = 'k'
    for j,energies in enumerate(args.energies):
        if args.colors:
            color = args.colors[j]
        add_adiabatic_map_to_axis(ax, style, energies, color)
    plt.savefig(args.output, dpi=args.dpi)

if __name__ == '__main__':
    main()



