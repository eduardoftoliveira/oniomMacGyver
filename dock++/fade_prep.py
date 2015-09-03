#!/usr/bin/env python3

import argparse
import numpy as np
import os

### Parser
PARSER = argparse.ArgumentParser(
        description = 'Read a prep and a frcmod files and multiply its charges and vdw by a constant. Puts the new files in a folder for each lambda',
        formatter_class = argparse.RawTextHelpFormatter)

PARSER.add_argument('prep',
                     help = 'prep file to change',
                   )

PARSER.add_argument('frcmod',
                    help = 'frcmod file to change',
                   )

PARSER.add_argument('-w',
                    help = 'size of each window',
                    type = float,
                    default = 0.02,
                    )


ARGS = PARSER.parse_args()
PREP = ARGS.prep
FRCMOD = ARGS.frcmod
WINDOW_SIZE = ARGS.w
WINDOWS = np.arange(0,1.01, WINDOW_SIZE)

def main():
    """Cycles over all windows and replaces the atomic charges and vdw radii
    in the prep and frcmod files, respectively"""

    for window in WINDOWS:
       
        ## create folder if it does not exists
        try:
            os.makedirs("{0:.2f}".format(window))
        except OSError:
            if not os.path.isdir(str(window)):
                raise

        # create new prep file 
        new_prep_filename = "{0:.2f}/{1}".format(window, PREP)
        with open(new_prep_filename, 'w') as new_prep_file:
            for line in open(PREP):
                if len(line.split())==8 and 'DUMM' not in line:
                    new_charge = float(line.split()[7])*window
                    line = line[:61] + "{:>12.6}\n".format(new_charge)
                new_prep_file.write(line)

        # create new frcmod file
        new_frcmod_filename = "{0:.2f}/{1}".format(window, FRCMOD)
        with open(new_frcmod_filename, 'w') as new_frcmod_file:
            is_reading = False # is true after reading a 'NONB\n' line
            for line in open(FRCMOD):
                if is_reading:
                    words = line.split()
                    if words and words[0] not in ("OW", "HW"):
                        radius_str = words[1]
                        radius = float(words[1])
                        new_radius = '{:6.4f}'.format(radius*window)
                        line = line.replace(radius_str, new_radius)
                    else:
                        is_reading = False
                else:
                    if 'NONB' in line:
                        is_reading = True
                new_frcmod_file.write(line)
    

if __name__ == "__main__":
    main()


