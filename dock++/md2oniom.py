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
                    default = [0,1, 1],
                    help = 'begin end step - use these points of the mdcrd only')

PARSER.add_argument('--qm_level',
                    type = str,
                    default = "b3lyp/6-31G(d)",
                    help = 'Level of theory for the QM calculation')

ARGS = PARSER.parse_args()
GAUCOM = ARGS.gaucom
MDCRD = ARGS.mdcrd
INIT, END, STEP = ARGS.selection
QM_LEVEL = ARGS.qm_level

def main():

    #open gaussian model file
    gaussian_file = gaussian.GaussianCom(GAUCOM)
    
    # read coordinates from mdcrd
    no_atoms = len(gaussian_file.atoms_list)
    for step in range(INIT,END,STEP):
        new_coordinates = amber.extract_from_mdcrd(MDCRD, no_atoms, step,
                                                  output_box_info = True) 
        box_dimensions = new_coordinates.pop(-1)
        for i, atom in enumerate(gaussian_file.atoms_list):
            atom.set_coordinates(new_coordinates[i])

        # make a new gaussian file with every conformation
        new_gaussian_filename = '{0:03d}_{1}'.format(step, GAUCOM) 
        print("Writing {} file".format(new_gaussian_filename))
        gaussian_file.write_to_file(new_gaussian_filename)

        # make a new gaussian with the qm layer only
        
        #qm_atoms_list =\
        #    [atom for atom in gaussian_file.atoms_list\
        #     if atom.oniom.layer == 'H']

        #qm_gaussian_filename = 'qm_{0:03d}_{1}'.format(step, GAUCOM)
        #qm_gaussian_file = gaussian.EmptyGaussianCom(qm_gaussian_filename)
        #qm_gaussian_file.multiplicity_line =\
        #        gaussian_file.multiplicity_line.split(' ', 4)[4]
        #qm_gaussian_file.atoms_list = qm_atoms_list
        #qm_gaussian_file.route_section = '#' + QM_LEVEL + '\n'
        # 
        #print("Writing {} file".format(qm_gaussian_filename))
        #qm_gaussian_file.write_to_file(qm_gaussian_filename)



if __name__ == "__main__":
    main()
