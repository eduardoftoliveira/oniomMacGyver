#!/usr/bin/env python
"""
Reads amber .prmtop and .inpcrd
Outputs gaussian .com
"""

import argparse
import os
import sys

# oniomMacGyver modules
from omg import prmtop

def get_args():
    """
    Parse arguments of amb_prmtop2gaucom.py
    """

    parser = argparse.ArgumentParser(
        description="""
            Reads Amber topology (.prmtop) and coordinates (.inpcrd) to produce
            a Gaussian input (.com).
        """, formatter_class=argparse.RawTextHelpFormatter)

    parser.add_argument('top', help='Amber topology (.prmtop / .top)')
    parser.add_argument('crd', help='Amber coordinates (.inpcrd / .crd)')
    parser.add_argument('--com', help='Name for new Gaussian input (.com)',
                        default=None)
    parser.add_argument('--notip3p', help='dont print TIP3P HrmBnd1',
                        default=False, action='store_true')
    parser.add_argument('--vmdsel',
                        help='VMD like selection ("not resname WAT")',
                        default='')

    args = parser.parse_args()

    if not args.com:
        args.com = os.path.splitext(args.top)[0] + '.com'

    # check if output exists
    if os.path.exists(args.com):
        sys.stderr.write('%s already exists. Aborting.\n' % (args.com))
        sys.exit(2)

    return args

def main():
    """
    Reads amber .prmtop and .inpcrd
    Outputs gaussian .com
    """
    args = get_args()
    mytop = prmtop.Prmtop(args.top)
    mytop.gen_oniom(args.com, args.crd, args.notip3p, args.vmdsel)

if __name__ == "__main__":
    main()

