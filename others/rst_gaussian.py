#!/usr/bin/python3
"""It reads a gaussian output file, detects 180º angles, 
and writes a com file where these angles are deactivated"""

# python modules
import sys

# qt modules
import gaussian
import molecules


def main():
    """It reads a gaussian output file and creates a input file
    with the last geometry."""
    
    ## set filenames and read log last geometry
    gaussian_log_name = sys.argv[1] 
    gaussian_name = gaussian_log_name[:-4]
    gaussian_com_name = gaussian_name + '.com'
    new_gaussian_com_name = gaussian_name + '_rst.com'
    
    log_atoms_list = gaussian.GaussianLog(gaussian_log_name).final_geometry
    gaussian_com_file = gaussian.GaussianCom(gaussian_com_name)
    gaussian_com_file.atoms_list = log_atoms_list
    gaussian_com_file.write_to_file(new_gaussian_com_name)



if __name__ == "__main__":
    main()
   



 

