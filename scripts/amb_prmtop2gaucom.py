#!/usr/bin/env python

import os
import subprocess
import math
import getopt
import sys

# oniomMacGyver modules
from omg import iolines
from omg import atoms
from omg import prmtop


def usage():
    print('usage:')
    print('    python3 amboniom.py')
    print('      --top      topology                .prmtop or .top')
    print('      --crd      coordinates             .inpcrd or .rst')
    print('      --newgau   new gaussian input      .com (usually)')
    print('')
    print('optional stuff:')
    print('      --vmdsel   "an easy selection"     use double quotes')
    print('      --notip3p                          dont print TIP3P HrmBnd1')

def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], '',[
            'top=', 'crd=', 'newgau=', 'vmdsel=', 'notip3p'])
    
    except getopt.GetoptError as err:
        usage()
        sys.stderr.write('ERROR:   ' + str(err)+'\n') # will print something like "option -a not recognized"
        sys.exit(2) 
    
    if len(args) != 0:
        usage()
        sys.exit(2)

    vmdsel = ''    
    tip3p = True
    for o, a in opts:
            if o == '--top':    top = a
            if o == '--crd':    crd = a
            if o == '--newgau': newgau = a
            if o == '--vmdsel': vmdsel = a
            if o == '--notip3p':    tip3p = False
    
    needed_args = ['top', 'crd', 'newgau']
    locals_now = locals()
    missed_args = [aa for aa in needed_args if aa not in locals_now]
    missing_msg = ', '.join(missed_args)
    
    if len(missed_args) > 0: 
        usage()
        sys.stderr.write(
            '\nERROR:     missing args:   %s\n' % (missing_msg))
        sys.exit(2)

    mytop = prmtop.Prmtop(top)
    mytop.gen_oniom(newgau, crd, tip3p, vmdsel)

main()
