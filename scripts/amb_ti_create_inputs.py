#!/usr/bin/env python
"""
Script to prepare input files for Amber thermodynamic integration calculations
"""

import argparse
import numpy as np
import os
import shutil

# omg imports
import omg.amber

###user input###
def get_args():
    "Argument parser for amb_ti_create_inputs.py"
    parser = argparse.ArgumentParser(
        description="Creates inputs files for Amber TI calculations")
    parser.add_argument(
        "--maskA", help="Initial atoms mask", required=True)
    parser.add_argument(
        "--maskB", help="Final atoms mask", required=True)
    parser.add_argument(
        "--prmtopA", help="Initial prmtop file", required=True)
    parser.add_argument(
        "--prmtopB", help="Final prmtop file", required=True)
    parser.add_argument(
        "--crdA", help="Initial coordinates file", required=True)
    parser.add_argument(
        "--crdB", help="Final coordinates file", required=True)
    parser.add_argument(
        "-l", "--lambdas", default=[0.1, 0.9, 0.1],
        help='lambda windows [initial, final, step] default = 0.1 0.9 0.1')
    parser.add_argument(
        "--in_files", default=["ti_min", "ti_equi", "ti_prod"],
        help="template amber input files in the correct order"
             " default = ti_min ti_equi ti_prod)")

    args = parser.parse_args()

    args.l_i = args.lambdas[0]
    args.l_step = args.lambdas[2]
    args.l_f = args.lambdas[1] + args.l_step
    return args


def main():
    """
    Creates the input files for a Amber Free Energy calculation
    """
    args = get_args()
    options_dict = {
        "scmask_i"  : ["", args.maskA, ""],
        "crgmask_i" : ["", args.maskA, args.maskB],
        "scmask_f"  : ["", args.maskB, ""],
        "crgmask_f" : [args.maskA, args.maskB, ""],
        "ifsc"      : ["0", "1", "0"],
        }
    # create step folders
    for step in [1, 2, 3]:
        foldername = "./step_{0}".format(step)
        if not os.path.exists(foldername):
            os.makedirs(foldername)
        for f in [args.prmtopA, args.prmtopB, args.crdA, args.crdB]:
            shutil.copyfile(f, "./{0}/{1}".format(foldername, f))

        ifsc = "ifsc={0}".format(options_dict["ifsc"][step-1])
        bar_l_min = "bar_l_min={0}".format(args.l_i)
        bar_l_max = "bar_l_max={0}".format(args.l_f)
        bar_l_incr = "bar_l_incr={0}".format(args.l_step)

        for l in np.arange(args.l_i, args.l_f, args.l_step):
            for v in ["i", "f"]:
                clambda = "clambda={0}".format(l)
                crgmask = "crgmask='{0}'".format(
                    options_dict["crgmask_{0}".format(v)][step-1])
                scmask = "scmask='{0}'".format(
                    options_dict["scmask_{0}".format(v)][step-1])
                for calc in args.in_files:
                    calc_filename = "./{0}/{1}_{2}_{3:.2f}_{4}.in".format(
                        foldername, calc, step, l, v)
                    omg.amber.write_amber_in(
                        calc, calc_filename, ifsc, clambda, crgmask, scmask,
                        bar_l_min, bar_l_max, bar_l_incr)

    # create groupfiles
    omg.amber.write_ti_groupfiles(args.in_files, args.l_i, args.l_f,
                                  args.l_step, args.prmtopA, args.crdA,
                                  args.prmtopB, args.crdB)


if __name__ == "__main__":
    main()
