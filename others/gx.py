#!/usr/bin/env python

from gaussian import GaussianLog as GL
from gaussian import GaussianCom as GC
import sys
import argparse
from os.path import splitext
from os.path import exists

def increment_gaucom_name(gaucom_name):
    """nha_nhe_23.com --> nha_nhe_24.com
       nha.com        --> nha_1.com     """

    name = splitext(gaucom_name)[0]
    if '_' in name:                           #             |
        if name.split('_')[-1].isdigit():     # all but the | digit
            digit = int(name.split('_')[-1])  #             V
            return '%s_%d.com' % ('_'.join(name.split('_')[:-1]), digit + 1)
    return name + '_1.com'

parser = argparse.ArgumentParser()
parser.add_argument('log', help='')
parser.add_argument('-s', required=False,
    help='scan step (default = last = 0)', default=0, type=int)
parser.add_argument('-o', required=False,
    help='opt step  (default = last = 0)', default=0, type=int)
parser.add_argument('--out', help='output name (default = based on input)')
parser.add_argument('--com', help='(default = same name as .log)')
args = parser.parse_args(sys.argv[1:]) 

if not args.com:
    args.com = splitext(args.log)[0] + '.com'
if not args.out:
    args.out = increment_gaucom_name(args.com)
if exists(args.out):
    sys.stderr.write('Output: %s already exists. Aborting.\n' % args.out)
    sys.exit(2)
args.s -=1
args.o -=1

gl = GL(args.log)
gc = GC(args.com)

byte = gl.bytedict['orientation:'][args.s][args.o]
coords = gl.read_coordinates('*', byte)
for atom,coord in zip(gc.atoms_list,coords):
    atom.set_coordinates(coord)

gc.write_to_file(args.out)


    


