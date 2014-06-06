#!/usr/bin/env python3
""" This scripts allows the user to make FEP calculations along a 
reaction coordinate with the AMBER and GAUSSIAN software packages"""

# qt modules
import gaussian
import amber

# other modules
import argparse
import textwrap
import os
import numpy as np
import decimal
import sys


### Parser
PARSER = argparse.ArgumentParser(
    description='Prepare inputs for FEP calculations',
    formatter_class=argparse.RawTextHelpFormatter)

PARSER.add_argument('function',
                    choices=["1","2","3","4"],
                    help=textwrap.dedent("""\
                Choose a step of the FEP calculation:
                    1 - Extract steps from gaussian log(s)
                    2 - Create input for the MD simulations
                    3 - Create SP calculations from the MD
                    4 - Calculate FEP energies""")
                   )

PARSER.add_argument('--log_points',
                    help =textwrap.dedent("""\
                    file begining end step (...)
                    frames to be extracted from gaussian log(s)"""),
                    metavar='n',
                    default=["irc.log", 1,1,1],
                    nargs='+')

PARSER.add_argument('--inputs_folder',
                    help = "folder with all input required files",
                   default = "required_files"
                   )

PARSER.add_argument('--com_charge_example',
                    help = "gaussian com example file to charge calculation ",
                   default = "gaussian_charge_example.com"
                   )

PARSER.add_argument('--com_amber_example',
                    help = "gaussian example file with amber system",
                   default = "gaussian_amber_example.com"
                   )

PARSER.add_argument('--sp_charge_folder',
                    help = "folder to put gaussian charge sp files",
                    default = "gaussian_sp_charges",
                   )

PARSER.add_argument('--overwrite',
                    help = "dangerous! delete folders before write them again",
                    action = "store_const",
                    const = True,
                    default = False
                   )

PARSER.add_argument('--md_folder',
                    help = "folder to put and read the md files",
                    default = "md_amber",
                   )

PARSER.add_argument('--inpcrd',
                    help = "amber coordinates file of the solvated model",
                    default = "model.inpcrd"
                   )

PARSER.add_argument('--prmtop',
                    help = "amber topologies file of the solvated model",
                    default = "model.prmtop"
                   )

PARSER.add_argument('--amber_in_files',
                    help = "amber input files for the dynamics",
                    nargs='+',
                    default = ["min.in", "mdp.in"],
                    metavar='in_file',
                   )

PARSER.add_argument('--sp_oniom_folder',
                    help = "folder to put the single point input files",
                    default = "oniom_sp"
                   )

#### PARSINGTHE OPTIONS
ARGS = PARSER.parse_args()
INPUT_FOLDER = ARGS.inputs_folder

LOG_POINTS_WORDS = ARGS.log_points
LOG_POINTS = []
for i in range(0, len(LOG_POINTS_WORDS), 4):
    LOG_FILE = "{0}/{1}".format(INPUT_FOLDER, LOG_POINTS_WORDS[i])
    POINTS = [int(n) for n in LOG_POINTS_WORDS[i+1:i+4]]
    LOG_POINTS.append([LOG_FILE]+POINTS)

AMBER_INPUT_FILES = []
for amber_file in ARGS.amber_in_files:
    AMBER_INPUT_FILES.append("{0}/{1}".format(INPUT_FOLDER, amber_file))


OVERWRITE = ARGS.overwrite
GAUSSIAN_CHARGE_EXAMPLE = "{0}/{1}".format(INPUT_FOLDER, 
                                           ARGS.com_charge_example)
GAUSSIAN_CHARGE_FOLDER = ARGS.sp_charge_folder
RUN_SP_SCRIPT_NAME = "{}/charge_run.sh".format(GAUSSIAN_CHARGE_FOLDER)
MODEL_INPCRD = "{0}/{1}".format(INPUT_FOLDER, ARGS.inpcrd)
MODEL_PRMTOP = "{0}/{1}".format(INPUT_FOLDER, ARGS.prmtop)
GAUSSIAN_AMBER_EXAMPLE = "{0}/{1}".format(INPUT_FOLDER, ARGS.com_amber_example)
AMBER_FOLDER  = ARGS.md_folder
SP_ONIOM_FOLDER = ARGS.sp_oniom_folder


# names
MD_NO_ATOMS = 35338  ##!!!!! HACK
SP_ONIOM_RUN_SCRIPT = "run.sh" 
RESULTS_FILE = "results.log"

#CONSTANTS
T = decimal.Decimal(310.15)
KB = decimal.Decimal(1.3806488E-23)
R = decimal.Decimal(8.31446211)
HKCAL = decimal.Decimal(627.5095)
HJOULE = decimal.Decimal(4.3597482E-18)
JKCAL = decimal.Decimal(0.000239005736)
NA = decimal.Decimal(6.0221413e+23)


###### FUNCTIONS ######

def parse_and_read_log(log_points):
    """ Returns a list of geometries from a gaussian irc log file
    
    It uses  a string like 'filename start end step'
    
    """
    geometries_list = []
    for file_and_points in log_points:
        scan_file_name, start, end, period = file_and_points
        # reading file
        scan_file = gaussian.GaussianLog(scan_file_name)
        for scan_step in range(start-1, end, period):
            print("Reading step {} of {}".format(scan_step + 1, scan_file_name))
            geometries_list.append(scan_file.read_geometry(-1, scan_step))
    print("Total of {} geometries".format(len(geometries_list)))
    return geometries_list


def log_to_sp():
    """ Creates single points for charges calculations """ 
    
    # create folder to put sp inputs
    try:
        os.makedirs(GAUSSIAN_CHARGE_FOLDER)
    except OSError:
        print("\n{0} folder already exists".format(GAUSSIAN_CHARGE_FOLDER))
        if OVERWRITE:
            print("--overwrite is on. I will write over the old files\n")
        else:
            print("Exiting without writing anything.")
            print("Delete the folder or use --overwrite to write "\
                  "over the old files\n")
            sys.exit(0)
    
    # reading scan log info
    geometries_list = parse_and_read_log(LOG_POINTS)

    sp_jobs_list = []
    # criar inputs de gaussian sp para o resp 
    for no, atoms_list in enumerate(geometries_list): 
        gaussian_sp_input_name = "charge_sp_{:03d}.com".format(no)
        sp_jobs_list.append(gaussian_sp_input_name)
        gaussian_sp_file = gaussian.GaussianCom(GAUSSIAN_CHARGE_EXAMPLE)
        gaussian_sp_file.atoms_list = atoms_list  
        gaussian_sp_file.write_to_file("{}/{}"
                .format(GAUSSIAN_CHARGE_FOLDER, gaussian_sp_input_name))
    
    #write bash script to run everything
    with open(RUN_SP_SCRIPT_NAME, 'w') as script_file:
        for job in sp_jobs_list:
            script_file.write("g09 {}\n".format(job))
    return None

def sp_to_md():
    """ Reads gaussian charge single points and writes the md inputs with"""
    #read model files
    model_coordinates = amber.read_crd_file(MODEL_INPCRD)
    model_charges = amber.read_prmtop_charges(MODEL_PRMTOP)
    
    # read single point charge inputs to know the geometries to create 
    charge_com_files = []
    for charge_com_file in os.listdir(GAUSSIAN_CHARGE_FOLDER):
        if charge_com_file.endswith(".com"):
            charge_com_files.append(charge_com_file)
    charge_com_files.sort()
    
    geometries_list = []
    for charge_com_file in charge_com_files:
        charge_com_file = "{}/{}".format(GAUSSIAN_CHARGE_FOLDER,
                                         charge_com_file)
        gaussian_charge_com = gaussian.GaussianCom(charge_com_file)
        geometries_list.append(gaussian_charge_com.atoms_list)
            
    # read numbers of important atoms 
    gaussian_amber_file = gaussian.GaussianCom(GAUSSIAN_AMBER_EXAMPLE)
    gaussian_sp_file = gaussian.GaussianCom(GAUSSIAN_CHARGE_EXAMPLE)
    
    amber_atoms_list = gaussian_amber_file.atoms_list
    gaussian_atoms_list = gaussian_sp_file.atoms_list
    
    amber_h_no_atoms_list = []
    amber_l_no_atoms_list = []
    amber_hl_no_atoms_list = []
    gaussian_h_no_atoms_list = []
    gaussian_l_no_atoms_list = []
    gaussian_hl_no_atoms_list = []
    amber_hl_atoms_list = []
    for no, atom in enumerate(amber_atoms_list):
        if atom.link_mm_type:
            amber_l_no_atoms_list.append(no)
            amber_hl_no_atoms_list.append(no)
            amber_hl_atoms_list.append(atom)
        if 'H' in atom.layer:
            amber_h_no_atoms_list.append(no)
            amber_hl_no_atoms_list.append(no)
            amber_hl_atoms_list.append(atom)
    for no, atom in enumerate(gaussian_atoms_list):
        if atom.link_mm_type:
            gaussian_l_no_atoms_list.append(no)
            gaussian_hl_no_atoms_list.append(no)
        if 'H' in atom.layer:
            gaussian_h_no_atoms_list.append(no)
            gaussian_hl_no_atoms_list.append(no)
    
    restraint_mask = amber.create_restraint_mask(amber_hl_no_atoms_list)
   
    ### write coordinates
    for step, atoms_list in enumerate(geometries_list):
        folder_name = "{}/{:02d}".format(AMBER_FOLDER, step)
        try:
            os.makedirs(folder_name)
        except OSError:
            print("\n{0} folder already exists".format(folder_name))
            if OVERWRITE:
                print("--overwrite is on. I will write over the old files\n")
            else:
                print("Exiting without writing anything.")
                print("Delete the folder or use --overwrite to"\
                      "write over the old files\n")
                sys.exit(0)
        
        # write coordinate file
        coordinates_list = [(atom.x, atom.y, atom.z) for atom in atoms_list]
        all_coordinates_list = model_coordinates[:]
        for index, no in enumerate(gaussian_hl_no_atoms_list):
            gaussian_no = no
            amber_no    = amber_hl_no_atoms_list[index]
            all_coordinates_list[amber_no] = coordinates_list[gaussian_no]
        
        crd_name = "{0}/inpcrd.inpcrd".format(folder_name)
        amber.write_crd_file(crd_name, all_coordinates_list, box_info=True,
                       velocities=False)

        #read resp new charges and write them to model prmtop
        charge_log_name = charge_com_files[step].replace(".com", ".log") 
        charge_log_name = "{0}/{1}".format(GAUSSIAN_CHARGE_FOLDER,
                                           charge_log_name)
        mulliken_charges_list = gaussian.read_mulliken_charges(charge_log_name)
        
        hl_charges_list = []
        for charge in mulliken_charges_list:
            if charge != 0:
                hl_charges_list.append(charge)

       
        new_charges_list = []
        for atom in amber_hl_atoms_list:
            if 'H' in atom.layer:
                new_charges_list.append(hl_charges_list.pop(0))
            else:
                new_charges_list.append(atom.charge)

        new_charge_amber_hl_atoms_list = amber.give_resp_charges(\
            amber_hl_atoms_list, new_charges_list)
        all_charges_list = model_charges[:]
        for index, no in enumerate(amber_hl_no_atoms_list):
            all_charges_list[no] = new_charge_amber_hl_atoms_list[index].charge
        
        # write these charges to a new prmtop
        new_prmtop_name = "{0}/prmtop.prmtop".format(folder_name)
        amber.write_prmtop_charges(MODEL_PRMTOP, new_prmtop_name, 
                                   all_charges_list) 
        
        # read and write amber in files
        for amber_in_name in AMBER_INPUT_FILES:
            with open(amber_in_name, 'r', encoding='UTF-8') as model_in_file:
                model_file_str = model_in_file.read()
            new_file_str = model_file_str.replace("XXXX", restraint_mask)
            new_file_name = "{}/{}".format(folder_name, 
                                           amber_in_name.split("/")[-1]) 
            with open(new_file_name, 'w', encoding='UTF-8') as new_in_file:
                new_in_file.write(new_file_str)

def md_to_sp():
    """ Creates gaussian sp inputs from the molecular dynamics"""
    oniom_gaussian_example = gaussian.GaussianCom(GAUSSIAN_AMBER_EXAMPLE)
    example_atoms_list = oniom_gaussian_example.atoms_list
    os.makedirs(SP_ONIOM_FOLDER)

    ## read single point charge inputs to know the geometries to create 
    charge_com_files = []
    for charge_com_file in os.listdir(GAUSSIAN_CHARGE_FOLDER):
        if charge_com_file.endswith(".com"):
            charge_com_files.append(charge_com_file)
    charge_com_files.sort()
    
    ## read geometries list and correct charges from log files 
    geometries_list = []
    for charge_com_file in charge_com_files:
        charge_com_file = "{}/{}".format(GAUSSIAN_CHARGE_FOLDER, 
                                         charge_com_file)
        gaussian_charge_com = gaussian.GaussianCom(charge_com_file)
        charge_com_atoms_list = gaussian_charge_com.atoms_list
 
        ############  read resp new charges 
        charge_log_name = charge_com_file.replace(".com", ".log") 
        
        mulliken_charges_list = gaussian.read_mulliken_charges(charge_log_name)
        
        for no, charge in enumerate(mulliken_charges_list):
            if charge != 0:
                charge_com_atoms_list[no].charge = float(charge)
        
        #############  end of charges reading ######### 

        geometries_list.append(charge_com_atoms_list)

    # read numbers of important atoms 
    gaussian_amber_file = gaussian.GaussianCom(GAUSSIAN_AMBER_EXAMPLE)
    gaussian_sp_file = gaussian.GaussianCom(GAUSSIAN_CHARGE_EXAMPLE)
    
    amber_atoms_list = gaussian_amber_file.atoms_list
    gaussian_atoms_list = gaussian_sp_file.atoms_list
    
    amber_hl_no_atoms_list = []
    gaussian_hl_no_atoms_list = []
    for no, atom in enumerate(amber_atoms_list):
        #if atom.link_mm_type or 'H' in atom.layer:
        if 'H' in atom.layer:
            amber_hl_no_atoms_list.append(no)
    for no, atom in enumerate(gaussian_atoms_list):
        #if atom.link_mm_type or 'H' in atom.layer:
        if 'H' in atom.layer:
            gaussian_hl_no_atoms_list.append(no)
    
    
    for md_no in sorted(os.listdir(AMBER_FOLDER)):
        folder_name = "{}/{}".format(SP_ONIOM_FOLDER, md_no)
        amber_folder_name = "{}/{}".format(AMBER_FOLDER, md_no) 
        os.makedirs(folder_name)
        mdcrd_name = "{}/{}".format(amber_folder_name, "mdp.mdcrd") 
       
        sp_jobs_list = []
        for sp_no in range(0, 1000, 1):  ####### TODO!!!!!!
            
            mdcrd_coordinates = amber.extract_from_mdcrd(mdcrd_name, 
                                                   MD_NO_ATOMS, sp_no)
            gaussian_atoms_list = []
            # an example file is used to read the pdb info

            for no, atom in enumerate(example_atoms_list):
                atom.x, atom.y, atom.z = mdcrd_coordinates[no]
                gaussian_atoms_list.append(atom)
            
            #### high layer geometry and charges come from the 
            ####charge single points
            
            for position in [-1, 0, 1]:
                hl_geometry_no = int(md_no)+position
                gaussian_path_file_name = "{}/{}_on_{}_{}"\
                        .format(folder_name, hl_geometry_no, int(md_no), sp_no)
                gaussian_name = "{}.com".format(gaussian_path_file_name)
                try:
                
                    for index, no in enumerate(gaussian_hl_no_atoms_list):
                        gaussian_no = no
                        amber_no    = amber_hl_no_atoms_list[index]
                                               
                        #gaussian_atoms_list[amber_no].charge =\
                        gaussian_atoms_list[amber_no].x,\
                        gaussian_atoms_list[amber_no].y,\
                        gaussian_atoms_list[amber_no].z =\
                            geometries_list[hl_geometry_no][gaussian_no].x,\
                            geometries_list[hl_geometry_no][gaussian_no].y,\
                            geometries_list[hl_geometry_no][gaussian_no].z
                            #geometries_list[hl_geometry_no][gaussian_no].charge

                    sp_jobs_list.append("{}_on_{}_{}.com"\
                            .format(hl_geometry_no, int(md_no), sp_no))
                    oniom_gaussian_example.atoms_list = gaussian_atoms_list
                    oniom_gaussian_example.write_to_file(gaussian_name)
                    print("Using {} and md:{}".format(charge_com_files[int(md_no)+position],md_no ))
                    print("Saved {}".format(gaussian_name))
              
                except IndexError:
                    print("Cannot save {}".format(gaussian_name))
    
        sp_script = "{}/{}".format(folder_name, SP_ONIOM_RUN_SCRIPT)  
        with open(sp_script, 'w') as script_file:
            for job in sp_jobs_list:
                script_file.write("g09 {}\n".format(job))



def sp_to_energies():
    """ Extract energies from the gaussian sp files"""
    with open(RESULTS_FILE, 'r') as result_file:
        results = {}
        for line in result_file:
            words = line.split()
            cut_from, this_one, _, frame = \
                    words[0].rstrip(".log").split("/")[1].split("_")
           
            energy = decimal.Decimal(words[5])
           
            if this_one not in results:
                results[this_one] = {}
            if frame not  in results[this_one]:
                results[this_one][frame] = [0, 0, 0]

            if int(cut_from) < int(this_one):
                results[this_one][frame][0] = energy # before
            elif int(cut_from) == int(this_one):
                results[this_one][frame][1] = energy # this
            else:
                results[this_one][frame][2] = energy # after

    for md_no in results:
        forward_energies = []
        backward_energies = []
        for frame in results[md_no]:
            previous_energy, this_energy, next_energy = results[md_no][frame]
            #print(previous_energy, this_energy, next_energy)
            if this_energy and next_energy:
                diff = (next_energy-this_energy)*HJOULE
                forward_energies.append(diff)
        
            if this_energy and previous_energy: 
                diff = (this_energy-previous_energy)*HJOULE
                backward_energies.append(diff)
                #print(md_no, frame, diff)


        if forward_energies:
            log_sum = 0
            for log_v in forward_energies:
                log_v = decimal.Decimal(log_v)
                log_v = np.exp(-log_v/(T*KB))
                log_sum += log_v

            exp_average = log_sum/len(forward_energies)
            delta_g = exp_average.ln() * -KB*T*NA*JKCAL
            print("f", md_no, delta_g)

        if backward_energies:
            log_sum = 0
            for log_v in backward_energies:
                log_v = decimal.Decimal(log_v)
                log_v = np.exp(-log_v/(T*KB))
                log_sum += log_v

            exp_average = log_sum/len(backward_energies)
            delta_g = exp_average.ln() * -KB*T*NA*JKCAL
            print("b", md_no, delta_g)

def main():
    """ Just a wrapper to call the functions"""
    functions = {'1':log_to_sp,
                 '2':sp_to_md,
                 '3':md_to_sp,
                 '4':sp_to_energies}

    function_to_run = ARGS.function
    functions[function_to_run]()



if __name__ == "__main__":
    main()
