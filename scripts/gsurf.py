#!/usr/bin/env python

import numpy as np
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

import sys
import getopt

from gaussian import GaussianLog as GL
import geom

def usage():
    print('usage:')
    print('  gsurf.py  1.log  2.log  3.log  ...  N.log')
    print('options:')
    print('     -x 1,2 [ ,3 [ ,4]]      (atom 1-indexes) default = Auto')
    print('     -y 1,2 [ ,3 [ ,4]]      (atom 1-indexes) default = Auto')
    print('     -e scf/oniom/model/low  (default = oniom or scf)')
    print('     -z same as -x and -y    (replaces energy in the Z-axis)')

def processinput(inputs):
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], 'x:y:e:z:')     
    except getopt.GetoptError as err:
        sys.stderr.write(err + '\n')
        usage()
        sys.exit(2)
    
    if len(args) < 1:
        usage()
        print('missing:')
        print('   .log file(s)')
        sys.exit(2)

    x, y, z = 'Auto', 'Auto', False
    energytype = 'default' # oniom/scf/model/low

    for o, a in opts:
        if o == '-x':   x = a
        elif o == '-y': y = a
        elif o == '-e': energytype = a.lower()
        elif o == '-z': z = a

    if (x == 'Auto') != (y == 'Auto'):
        usage()
        print('input error:')
        print('    -x and -y must be (un)used together')
        sys.exit(2)

    return (args, x, y, z, energytype)

def atom_1_indexes_to_str(gl, atom_idxs):
    strings1, strings2 = [], []
    template = '%5d(%s)%s'
    for i in atom_idxs:
        strings1.append(str(i))
        try:
            strings2.append(template % (
                gl.atoms_list[i-1].resinfo.resnum,
                gl.atoms_list[i-1].resinfo.resname,
                gl.atoms_list[i-1].resinfo.name))
        except:
            strings2 = ''
            
    return ','.join(strings1) + ' = ' + ','.join(strings2)

    
def cat_modreds(GaussianLogList):
    """get studied distances, angles and dihedrals from GaussianLogList"""
    atomids = [] # tuples of 1-indexed atom indexes 
    resinfo = [] # associated residue information
    for gl in GaussianLogList:
        if gl.modreds:
            for modred in gl.modreds:
                if tuple(modred.atomids) not in atomids:
                    atomids.append(tuple(modred.atomids))
                    resinfo.append(atom_1_indexes_to_str(gl, modred.atomids))
    return (atomids, resinfo)
        

def processcoordinates(atomids, xin, yin, zin):
    """if len(atomids) == 2, xin and yin may be 'Auto'"""

    if xin != 'Auto' and yin != 'Auto': 
        x = tuple([int(i) for i in xin.split(',')])
        y = tuple([int(i) for i in yin.split(',')])
        if zin:
            z = tuple([int(i) for i in zin.split(',')])
        else:
            z = zin
        if x not in atomids or y not in atomids: # or z not in atomids:
            print('WARNING: some indexes unspecified in any .log modred') 

    elif xin == 'Auto' and yin == 'Auto':
        if len(atomids) != 2:
            raise RuntimeError('Need exactly two scanned coordinates or use -x, -y')
        else:
            return atomids[0], atomids[1], False # TODO -z and not -x,-y

    else:
        raise RuntimeError('-x and -y must be used together')

    return x, y, z

def match_gaussianlogs(gl1, gl2): # MISC
    """element MM-info, mask, layer, links, RESINFo"""
    pass

def energytype_convert(gl, energytype):
    if energytype == 'default':
        if gl.bytedict['ONIOM: calculating energy.'] == [[]]:
            return 'SCF_energy'
        else:
            return 'ONIOM_extrapol'
    elif energytype == 'scf':
        return 'SCF_energy'
    elif energytype == 'oniom':
        return 'ONIOM_extrapol'
    elif energytype == 'model':
        return 'ONIOM_model_high'
    elif energytype == 'low':
        return 'ONIOM_lowlayer_low'
    else:
        usage()
        print('Error:')
        print('  -e %s not accepted' % energytype)    
        sys.exit(2)

def get_energy_by(gl, atomidx_list, energykey):
    """
    input is a list of tuples of atom indexes:
    [(1,2), (3,4,5), (4,5,6,9)]
    in this case a distance, an angle and a dihedral

    the output is a list of lists containing the value of the metric for
    each scan_pt (or opt_pt if optimization)
    and a list with the energy (energytype ONIOM?)
    """

    metrics = []

    # ENERGIES:     if scan: last opt in each step;     if opt: last scan_pt
    if len(gl.bytedict['Converged?']) > 1:
        energies = [e[-1] for e in gl.energies[energykey]]
        for atomidx in atomidx_list:
            metric = []
            for byteS in gl.bytedict['orientation:']:
                xyz = gl.read_coordinates(atomidx, byteS[-1])
                metric.append(geom.anymetric(xyz))
            metrics.append(metric)
    else:
        energies = gl.energies[energykey][-1]
        for atomidx in atomidx_list:
            metric = []
            for byte in gl.bytedict['orientation:'][-1]:
                xyz = gl.read_coordinates(atomidx, byte)
                metric.append(geom.anymetric(xyz))
            metrics.append(metric)

    return metrics, energies


def main():
    (filein_list, x, y, z, energytype) = processinput(sys.argv[1:])

    print('Reading .log files...')
    gls = [GL(filein) for filein in filein_list]
    print('')
    print('WARNING: models are not checked for consistency (YET)')
    print('')

    # read scanned coordinates
    (atomids, resinfo) = cat_modreds(gls)
    print('Frozen or Scanned coordinates in all .log modreds:')
    for string in resinfo:
        print(string)
    print('')
    xid, yid, zid = processcoordinates(atomids, x, y, z)

    # resinfo to have x and y labels
    try:
        resinfo = [atom_1_indexes_to_str(gls[0], xy) for xy in [xid, yid]]
    except:
        resinfo = [x, y]

    xid = [x-1 for x in xid]
    yid = [y-1 for y in yid]
    if zid:
        zid = [z-1 for z in zid]

    # get key for gl.energies dict
    energykey = energytype_convert(gls[0], energytype)

    # compute coordinates / energy 
    if not zid:
        X, Y, Z = [], [], []
        for gl in gls:
            (x, y), z = get_energy_by(gl, [xid, yid], energykey )
            X.append(x)
            Y.append(y)
            Z.append(z)
    else:
        X, Y, Z = [], [], []
        for gl in gls:
            (x, y, z), _ = get_energy_by(gl, [xid, yid, zid], energykey)
            X.append(x)
            Y.append(y)
            Z.append(z)
            

    # transform energies
    HARTREE2KCAL = 627.509
    min_energy = min([min(z) for z in Z])
    E = []
    for z in Z:
        if not zid:
            E.append([HARTREE2KCAL*(e-min_energy) for e in z])
        else:
            E.append([e for e in z])

    # plot
    fig = plt.figure()
    ax = fig.gca(projection='3d')

    markers = ['o','s','^','p','*']
    colors = ['b','r','k','c','g','m','y']  
    combos = []
    for m in markers:
        for c in colors:
            combos.append((m,c))

    for (x,y,e,c,f) in zip(X,Y,E,combos,filein_list):
        #ax.scatter(x,y,e,marker=c[0], color=c[1])
        ax.plot(x,y,e,c[0]+c[1], label=f)
   
    ax.set_xlabel(resinfo[0]) 
    ax.set_ylabel(resinfo[1]) 

    if not zid:
        ax.set_zlim(0, min(50,max([max(e) for e in E])))
    ax.legend()

    plt.show()

main()

#

#fig = plt.figure()
#ax = fig.gca(projection='3d')
#
#xs = [0,1,2,3,4]
#ys = [4,1,3,2,0]
#zs = [4,3,0,2,1]
#
#ax.scatter(xs, ys, zs, c='r', marker='^')
#
#ax.set_xlabel('Distance 1')
#ax.set_ylabel('Distance 2')
#ax.set_zlabel('Energy')
#
#plt.show()
