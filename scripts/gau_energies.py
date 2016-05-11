#!/usr/bin/env python

import os
import sys
import argparse
import subprocess
from omg.gaussian.gaussian import GaussianLog as GAULOG
from omg.gaussian.gaussian import GaussianCom as GAUCOM
from omg import atoms
from omg import iolines

def pts_to_int(pts):
    try:
        pts = int(pts) - 1
        return int(pts)
    except:
        if pts =='all':
            return pts
        else:
            usage()
            sys.stderr.write('bad input:\n')
            sys.stderr.write('  expected int or all, but got %s:\n' % pts)
            sys.exit(2)

def get_args():
    "Parse arguments of gau_makepdb"
    parser = argparse.ArgumentParser(
        description="""
    Extract energies from gaussian .log and
    print to standard output in .csv format

    Typical usage:
        gau_energies.py oniom.log > oniom.csv


""", formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('log', help='Gaussian .log')
    parser.add_argument('-s', '--scan_step',
                        help='Scan step ("all" or integer) default="all"',
                        default='all')
    parser.add_argument('-o', '--opt_step',
                    help='Scan step ("all" or integer) default = last = 0"',
                        default='0')
    args = parser.parse_args()

    # parse input extension
    basename, input_extension = os.path.splitext(args.log)
    if input_extension not in ['.log', '.com']:
        sys.stderr.write('Aborting!\n')
        sys.stderr.write('  inputname suffix is: %s\n' % input_extension)
        sys.stderr.write('  must be ".com" or ".log"\n')
        sys.exit(2)
    args.ext = input_extension
    args.base = basename

    # scan and opt steps
    args.scan_step = pts_to_int(args.scan_step)
    args.opt_step  = pts_to_int(args.opt_step)

    return args

 # get key for gl.energies dict
    energykey = energytype_convert(gl, energytype)

def getel(gaulog, scan_pts, opt_pts, energykey):
    "returns energy of type key for scan_pts and opt_pts"
    E = gaulog.energies[energykey]
    if scan_pts == 'all' and opt_pts == 'all':
        return [e for elist in E for e in elist]
    elif scan_pts == 'all' and type(opt_pts) == int:
        return [elist[opt_pts] for elist in E]
    elif type(scan_pts) == int and opt_pts == 'all':
        return E[scan_pts]
    elif type(scan_pts) == int and type(opt_pts) == int:
        return [E[scan_pts][opt_pts]]
    else:
        sys.stderr.write('Bad input for --scan_step or --opt_step\n')
        sys.stderr.write('Aborting.\n')
        sys.exit(2)

def getstatus(gaulog, scan_pts, opt_pts):
    "returns list of current scan point and convergence status"

    B = gaulog.bytedict['Converged?']
    if scan_pts == 'all' and opt_pts == 'all':
        bytelist = [b for blist in B for b in blist]
        scan_i = [i+1 for i,blist in enumerate(B) for _ in blist]
    elif scan_pts == 'all' and type(opt_pts) == int:
        bytelist = [blist[opt_pts] for blist in B]
        scan_i = [i+1 for i in range(len(B))]
    elif type(scan_pts) == int and opt_pts == 'all':
        bytelist = B[scan_pts]
        scan_i = [scan_pts for _ in B[scan_pts]]
    elif type(scan_pts) == int and type(opt_pts) == int:
        bytelist = [B[scan_pts][opt_pts]]
        scan_i = [scan_pts]

    converged = []
    for b in bytelist:
        (_,values,thresholds) = gaulog.read_converged(b) 
        status = 'YES'
        for v,t in zip(values, thresholds):
            if v > t:
                status = 'NO'
                break
        converged.append(status)

    return converged, scan_i


        

def main():
    
    args = get_args()

    gl = GAULOG(args.log)

    scf     = getel(gl, args.scan_step, args.opt_step, 'SCF_energy')
    oniom   = getel(gl, args.scan_step, args.opt_step, 'ONIOM_extrapol')
    high    = getel(gl, args.scan_step, args.opt_step, 'ONIOM_model_high')
    low     = getel(gl, args.scan_step, args.opt_step, 'ONIOM_lowlayer_low')

    converged, scan_i = getstatus(gl, args.scan_step, args.opt_step)

    line = '%16.8f,%16.8f,%16.8f,%16.8f,%6d,%9s\n'
    text = '%16s,%16s,%16s,%16s,%6s,%9s\n' % (
            'SCF', 'Oniom', 'HighLayer', 'LowLayer', 'ScanPt', 'Converged')
    for s,o,h,l,i,c in zip(scf, oniom, high, low, scan_i, converged ):
        text += line % (s,o,h,l,i,c)
    print text,

if __name__ == '__main__':
    main()



