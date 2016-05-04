#!/usr/bin/env python
"""It reads a gaussian output file, detects what is 
causing the micro iteration error and writes a com file 
where these atoms are frozen"""

# python modules
import sys

# qt modules
from omg.gaussian import gaussian


## These parameters may require tweaking
HOW_MANY_ATOMS = 4


def main():
    """It reads a gaussian output file and detects 180 angles 
    It then writes a .com file from another model .com file
    where these angles are deactivated."""
    
    ## set filenames and read log last geometry
    gaussian_log_name = sys.argv[1] 
    gaussian_name = gaussian_log_name[:-4]
    gaussian_com_name = gaussian_name + '.com'
    new_gaussian_com_name = gaussian_name + '_rst.com'
    
    log_geometries = gaussian.GaussianLog(gaussian_log_name)\
            .read_last_microiterations()

    dist_list = []
    for no, atom in enumerate(log_geometries[-1]):
        if atom.element != 'H':
            dist_list.append((no, atom.distance(log_geometries[-2][no])))
        
    dist_list.sort(key=lambda x: -x[1])

    gaussian_com_file = gaussian.GaussianCom(gaussian_com_name)
    atoms_list = gaussian_com_file.atoms_list
    
    for no, atom in enumerate(atoms_list):
        atom.x = log_geometries[-1][no].x
        atom.y = log_geometries[-1][no].y
        atom.z = log_geometries[-1][no].z

    print("Freezing atoms:")
    for i in range(HOW_MANY_ATOMS):
        atom = atoms_list[dist_list[i][0]]
        atom.mask = "-1"
        print(atom, dist_list[i][0]+1)


    ## Write new gaussian file from a model com file
    gaussian_com_file.write_to_file(new_gaussian_com_name)

    return None


if __name__ == "__main__":
    main()
 


