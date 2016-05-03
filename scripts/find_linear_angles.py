#!/usr/bin/python
"""It reads a gaussian output file, detects 180 angles, 
and writes a com file where these angles are deactivated"""

# python modules
import sys

# qt modules
import gaussian
import molecules


## These parameters may require tweaking
MAX_ANGLE = 179
MAX_DISTANCE = 3


def main():
    """It reads a gaussian output file and detects 180 angles 
    It then writes a .com file from another model .com file
    where these angles are deactivated."""
    
    ## set filenames and read log last geometry
    gaussian_log_name = sys.argv[1] 
    gaussian_name = gaussian_log_name[:-4]
    gaussian_com_name = gaussian_name + '.com'
    new_gaussian_com_name = gaussian_name + '_rst.com'
    
    #log_atoms_list = gaussian.GaussianLog(gaussian_log_name).final_geometry
    log_atoms_list = gaussian.GaussianCom(gaussian_com_name).atoms_list

    ## find linear angles
    linear_angles_list = molecules.find_linear_angles(log_atoms_list, 
          max_angle = MAX_ANGLE, max_distance = MAX_DISTANCE,
          ignore_low_layer=True)
    
    ## print found linear atoms and create according new modred lines
    if linear_angles_list:
        print("Linear angles detected:")
    else:
        print("No linear angles detected")
    
    new_modred_lines = []
    for angle_tuple in linear_angles_list:
        angle = angle_tuple[0]
        atoms = angle_tuple[1:]
        indexes = [log_atoms_list.index(atom) + 1 for atom in atoms]
        
        ## info 
        print("{0:6.2f} {1[0]} {1[1]} {1[2]}:"
              "A {2[0]} {2[1]} {2[2]} K".format(angle, atoms, indexes ))
        
        new_modred_lines.append("A {0[0]} {0[1]} {0[2]} K\n".format(indexes))

    ## Write new gaussian file from a model com file
    gaussian_com_file = gaussian.GaussianCom(gaussian_com_name)
    gaussian_com_file.atoms_list = log_atoms_list
    gaussian_com_file.additional_input_dict['modred'].extend(new_modred_lines)
    gaussian_com_file.write_to_file(new_gaussian_com_name)



if __name__ == "__main__":
    main()
   



 

