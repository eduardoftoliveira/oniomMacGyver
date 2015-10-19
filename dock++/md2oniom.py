#!/usr/bin/env python

# python modules
import argparse


# qt modules
import gaussian
import amber

PARSER = argparse.ArgumentParser(
  description = 'Create many gaussian input files from a model file and a mdcrd',
  formatter_class = argparse.RawTextHelpFormatter)

PARSER.add_argument('gaucom',
                    help = 'gaussian model file')

PARSER.add_argument('mdcrd',
                    help = 'mdcrd file')

PARSER.add_argument('--selection',
                    nargs = 3,
                    type = int,
                    default = [1,2, 1],
                    help = 'begin end step - use these points of the mdcrd only')


ARGS = PARSER.parse_args()
GAUCOM = ARGS.gaucom
MDCRD = ARGS.mdcrd
INIT, END, STEP = ARGS.selection

def main():

    #open gaussian model file
    gaussian_file = gaussian.GaussianCom(GAUCOM)
    
    # read coordinates from mdcrd
    no_atoms = len(gaussian_file.atoms_list)
    for step in range(INIT,END,STEP):
        new_coordinates = amber.extract_from_mdcrd(MDCRD, no_atoms, step-1,
                                                  output_box_info = True) 
        box_dimensions = new_coordinates.pop(-1)
        for i, atom in enumerate(gaussian_file.atoms_list):
            atom.set_coordinates(new_coordinates[i])

        # make a new gaussian file with every conformation
        new_gaussian_filename = '{0:04d}_{1}'.format(step, GAUCOM) 
        print("Writing {}".format(new_gaussian_filename))
        gaussian_file.write_to_file(new_gaussian_filename)

if __name__ == "__main__":
    main()
