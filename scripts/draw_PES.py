#!/usr/bin/env python

import matplotlib as mpl
from matplotlib import pyplot as plt
import sys

def add_adiabatic_map_to_axis(axis, energies, labels='auto'):
    WIDTH = 6
    SPACING = 10
    START = 3

    # Automatic labels: TS1, INT1, TS2, etc..
    if labels == 'auto':
        labels = ['R']
        N = len(energies)
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

    # Energy horizontal decks
    x = START
    for energy in energies:
        axis.plot([x, x+WIDTH], [energy, energy], '-k', linewidth=2)
        x += SPACING

    xlim = x - SPACING + START + WIDTH

    # Connect steps
    x = START 
    for i in range(1, len(energies)):
        x1 = x + WIDTH
        x2 = x + SPACING
        y1 = energies[i-1]
        y2 = energies[i]
        axis.plot([x1, x2], [y1, y2], '-k')
        x += SPACING

    # Appearance 
    ylim_range = max(energies)-min(energies)
    ymin = min(energies) - 0.1 * ylim_range
    ymax = max(energies) + 0.1 * ylim_range
    axis.set_ylim(ymin, ymax)
    axis.set_xlim(0, xlim)
    axis.set_xticks([START+i*SPACING+WIDTH/2.0 for i in range(len(energies))])
    axis.set_xticklabels(labels)
        
    
def main():

    # Configure Figure
    fig = plt.gcf()
    fig.set_size_inches(3.3, 2.5)
    mpl.rcParams.update({'font.size': 7, 'axes.linewidth':0.5})
    plt.subplots_adjust(bottom=.15)
    plt.subplots_adjust(left=.15)
    plt.ylabel('Energy (kcal/mol)')
    ax = fig.gca()
    #ax.grid(True)

    # input energies
    energies = [float(e) for e in sys.argv[1:]]    

    add_adiabatic_map_to_axis(ax, energies)

    plt.savefig('test.svg')
    #plt.savefig('test.png', dpi=300)


if __name__ == '__main__':
    main()




    
