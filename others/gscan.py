#!/usr/bin/env python

import sys, argparse, geom
from os.path import exists
from os.path import splitext
from gaussian import GaussianCom as GC
from gaussian import GaussianLog as GL
from gaussian import ModRed


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
parser.add_argument('COM', help='.com file to perform scans')

mode = parser.add_mutually_exclusive_group()
mode.add_argument('--keep', action='store_true', default=True,
    help = 'keep all existing modred (DEFAULT)')
mode.add_argument('--delete', action='store_true',
    help = 'delete frozen and scaned modred')
mode.add_argument('--deleteALL', action='store_true',
    help = 'delete ALL modred')
parser.add_argument('--Bfreeze', nargs=2, type=int, action='append',
    help='bond atom indexes')

group = parser.add_argument_group('Scans')
group.add_argument('--Bscan', nargs=2, type=int,
    help='bond atom indexes (needs --target)')
group.add_argument('--target', type = float,
    help='target distance for scan')
group.add_argument('--nsteps', type=int, help='DEFAULT = 10')
group.add_argument('--stepsize', type=float)

group2 = parser.add_argument_group('Get Coords')
group.add_argument('--log', help='.log file to get coordinates')

# DEFAULTS
DEFAULT_NSTEPS = 10

# do the magic
args = parser.parse_args(sys.argv[1:])

# check
if (args.delete or args.deleteALL):
    args.keep = False

# Conflicting scan properties 
if args.Bscan:
    if args.nsteps and args.stepsize and args.target:
        parser.print_help()
        sys.stderr.write('\ngscan.py: error:\n')
        sys.stderr.write('    max. 2 from --target/--nsteps/--stepsize\n')
        sys.exit(2)
    elif args.target and not (args.stepsize or args.nsteps):
        args.nsteps = DEFAULT_NSTEPS
    elif not args.target and not (args.stepsize and args.nsteps):
        parser.print_help()
        sys.stderr.write('\ngscan.py: error:\n')
        sys.stderr.write('    if no --target, need both --nsteps/--stepsize\n')
        sys.stderr.write('    the default --nsteps works only with --target\n')
        sys.exit(2)
       
# provides scan properties without --Bscan
elif args.Bscan == None:
    if args.nsteps or args.stepsize or args.target:
        parser.print_help()
        sys.stderr.write('\ngscan.py: error:\n')
        sys.stderr.write('    --target/--nsteps/--stepsize only with --Bscan\n')
        sys.exit(2)

def getdist(a,b,gc):
    return geom.distance(
        gc.atoms_list[a-1].get_coordinates(),
        gc.atoms_list[b-1].get_coordinates()
    )

gc = GC(args.COM)

# handle existing modreds
if args.keep:
    new_modred = gc.modreds
elif args.delete:
    new_modred = [m for m in gc.modreds if m.action not in ['S', 'F']]
elif args.deleteALL:
    new_modred = []

# check conflicts
to_add = []
if args.Bfreeze:
    to_add += args.Bfreeze
if args.Bscan:
    to_add += [args.Bscan]
for m in new_modred:
    for atomids in to_add:
        x = atomids[:]
        x.sort()
        y = m.atomids[:]
        y.sort()
        if x == y:
            sys.stderr.write(
'\nYou are trying to add a coordinate that already exists in %s\n' % args.COM
            )
            sys.stderr.write('Consider using --delete / --deleteALL\n')
            sys.exit()

# calculate scan properties and add to new_modred
if args.Bscan:
    i, j = args.Bscan
    curr_dist = getdist(i, j, gc)

    #print 'distance = %.2f' % (curr_dist)

    if args.target and args.nsteps:
        stepsize = (args.target - curr_dist) / args.nsteps
        nsteps = args.nsteps
    elif args.target and args.stepsize:
        stepsize = args.stepsize
        nsteps = (args.target - curr_dist) / args.stepsize
    elif not args.target and (args.nsteps and args.stepsize): 
        stepsize = args.stepsize
        nsteps = args.nsteps
    else:
        sys.stderr.write('\nShould not be here, something went wrong :(\n\n')
        sys.exit()

    #print nsteps, stepsize

    new_modred.append(ModRed('B %d %d S %d %.4f\n' % (i,j,nsteps,stepsize)))

if args.Bfreeze:
    for i,j in args.Bfreeze:
        new_modred.append(ModRed('B %d %d F\n' % (i,j)))

gc.modreds = new_modred
#gc.additional_input_dict['modred'] = [m.line for m in new_modred]

# update coordinates
if args.log:
    gl = GL(args.log)
    xyz = [atom.get_coordinates() for atom in gl.final_geometry]
    for atom, coords in zip(gc.atoms_list, xyz):
        atom.set_coordinates(coords) 

# add modred to opt in route_section if necessary    
gc.route_section.keywords['opt'].set('modred')

# write new file
output = increment_gaucom_name(args.COM)
if not exists(output):
    gc.write_to_file(output)
    print '%s' % output
else:
    sys.stderr.write('%s already exists... not doing anything\n' % output)

#print args

