#!/usr/bin/env python
"""
Reads a structure from a Gaussian Log file and other parameters from a
Gaussian Com file and creates a new Gaussian Com.

"""

import argparse
import sys
import os

# qt_scripts modules
from omg.gaussian.gaussian import GaussianLog
from omg.gaussian.gaussian import GaussianCom
from omg.misc import increment_filename

def get_args():
    "Parse arguments of gau_log2com.py"
    parser = argparse.ArgumentParser(
        description="""
            Reads a structure from a Gaussian Log file and other parameters from a  
            Gaussian Com file and creates a new Gaussian Com.""",
        formatter_class=argparse.RawTextHelpFormatter)

    parser.add_argument('log', help='gaussian log filename')

    parser.add_argument('-s', '--scan_step',
                        help='scan step (default = last = 0)',
                        default=0,
                        type=int)
    parser.add_argument('-o', '--opt_step',
                        help='opt step  (default = last = 0)',
                        default=0,
                        type=int)
    parser.add_argument('--new_com',
                        help='new com name (default = increment template com)',
                        default='')
    parser.add_argument('--template_com',
                        help='(default = same name as .log)',
                        default='')

    args = parser.parse_args()
    if args.template_com == '':
        args.template_com = os.path.splitext(args.log)[0] + '.com'
    if args.new_com == '':
        args.new_com = increment_filename(args.template_com)
    if os.path.exists(args.new_com):
        sys.stderr.write(
            '{0} already exists. Aborting.\n'.format(args.new_com))
        sys.exit(2)
    args.scan_step -= 1
    args.opt_step -= 1

    return args

def main():
    """
    Reads a structure from a Gaussian Log file and other parameters from a
    Gaussian Com file and creates a new Gaussian Com.
    """
    args = get_args()
    gaulog = GaussianLog(args.log)
    gaucom = GaussianCom(args.template_com)
    atoms_log_coords = gaulog.read_geometry(args.opt_step, args.scan_step)
    for no, atom in enumerate(gaucom.atoms_list):
        atom.SetVector(atoms_log_coords[no].GetVector())
    gaucom.write_to_file(args.new_com)

if __name__ == "__main__":
    main()


