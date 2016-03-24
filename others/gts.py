#!/usr/bin/env python

import sys, argparse
import numpy as np
from os.path import splitext
from matplotlib import pyplot as plt
from gaussian import GaussianLog as GL
from gaussian import GaussianCom as GC
from gaussian import ModRed
from geom import distance

def increment_gaucom_name(gaucom_name):
    """nha_nhe_23.com --> nha_nhe_24.com
       nha.com        --> nha_1.com     """

    name = splitext(gaucom_name)[0]
    if '_' in name:                           #             |
        if name.split('_')[-1].isdigit():     # all but the | digit
            digit = int(name.split('_')[-1])  #             V
            return '%s_%d.com' % ('_'.join(name.split('_')[:-1]), digit + 1)
    return name + '_1.com'

def readconf(filename):
    bonds = []
    cutoff = 0.5 # DEFAULT
    for line in open(filename):
        if line.strip().startswith('B '):
            fields = line.split()
            a,b,c = int(fields[1])-1, int(fields[2])-1, float(fields[3])
            bonds.append((a,b,c))
        elif line.startswith('CUTOFF'):
            cutoff = float(line.split()[1])
    return bonds, cutoff

def gldist(globj, atom1, atom2):
    dist = []
    for opt in globj.bytedict['orientation:']:
        dist.append([])
        for byte in opt:
            xyz1 = globj.read_coordinates(atom1, byte)[0]
            xyz2 = globj.read_coordinates(atom2, byte)[0]
            dist[-1].append(distance(xyz1, xyz2))
    return dist

def ll2l(ll):
    L, lens = [], []
    for l in ll:
        lens.append(len(l))
        L += l
    return np.array(L), lens

def idx_l(i, szs):
    """find step (major) and opt (minor) from a linearized list of lists"""
    cum = [0]
    for maj,s in enumerate(szs):
        cum.append(cum[-1] + s)
        if cum[-2] <= i < cum[-1]:
            major = maj
            minor = i-cum[-2]
    return major, minor
        
def calcrms(globj, bonds):
    alllin = []
    for bond in bonds:
        dist = gldist(globj, bond[0], bond[1])
        lindist, szs = ll2l(dist)
        lindist -= bond[2]
        lindist = lindist**2
        alllin.append(lindist)
    sq = np.vstack(alllin)
    return np.sqrt(sum(sq)), szs
       
# parser stuff 
parser = argparse.ArgumentParser()
parser.add_argument('--conf',required=True, help='Bonds to define TS')
parser.add_argument('--com', required=True, help='.com file (template)')
parser.add_argument('--log', required=True, help='.log file to extrac structure')
parser.add_argument('--out', help='output .com')
args = parser.parse_args(sys.argv[1:]) 

# process input
glog = GL(args.log)
gcom = GC(args.com)
bonds, cutoff = readconf(args.conf)
if not args.out:
    args.out = increment_gaucom_name(args.com)

# find TS
ts_rmsd, scans_size = calcrms(glog, bonds)     # calculate RMSD from TS reference
closest_index = np.argmin(ts_rmsd)          # find closest structure to TS
scan, opt = idx_l(closest_index, scans_size)# corresponding scanstep and opt

# make a pretty picture
plt.plot(ts_rmsd, '-k', linewidth=2)
plt.plot([0,len(ts_rmsd)], [cutoff, cutoff], '-r', linewidth=2)
plt.savefig(splitext(args.com)[0]+'.ts_rmsd.png')

# close enough to TS to proceed?
if ts_rmsd[closest_index] < cutoff:
    byte = glog.bytedict['orientation:'][scan][opt]
    coordinates = glog.read_coordinates('all', byte)
else:
    print 'NOT DOING ANYTHING: TS not found.'
    print 'Lowest RMSD from TS (%.3f) > CUTOFF(%.3f)' % (min(ts_rmsd), cutoff)
    sys.exit()

# update coordinates
for (atom,xyz) in zip(gcom.atoms_list, coordinates):
    atom.set_coordinates(xyz)

# update opt 
gcom.route_section.keywords['opt'].set('ts')
gcom.route_section.keywords['opt'].set('noeigen')
gcom.route_section.keywords['opt'].set('calcfc')

# delete modreds
gcom.route_section.keywords['opt'].rm('modred')
gcom.modreds = [] # GC.additional_input_dict updated in GC.write_to_file()

# write output
gcom.write_to_file(args.out)



