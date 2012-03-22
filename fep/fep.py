#!/usr/bin/env python3

# my modules
from gaussian import GaussianLog, EmptyGaussianCom
from amber import *
# other modules
import os

# input - do this in a outside file
# file start end step
user_input_lines = ["glu_scan.log 1 1 1"]
RESP_ROUTE_SECTION = """#hf/6-31G* Pop(mk) density=current
iop(6/33=2) scf=tight gfinput gfprint test\n"""
CHARGE_AND_MULTIPLICITY = "0 1\n"
# names
GAUSSIAN_SP_FOLDER = "./gaussian_sp"
RUN_SP_SCRIPT_NAME = "{}/sp_run.sh".format(GAUSSIAN_SP_FOLDER)
RESP_FOLDER = "./resp"
RUN_RESP_SCRIPT_NAME = "{}/resp_run.sh".format(RESP_FOLDER)
AMBER_INPUT_FOLDER = "./amber_in"
AMBER_INPUT_FILES = ["min1.in", "min2.in", "mdp.in", "mdi.in"]
PDB_MODEL = "{}/model.pdb".format(AMBER_INPUT_FOLDER)# model PDB, tleap must read this without errors
MODEL_INPCRD = "{}/model.inpcrd".format(AMBER_INPUT_FOLDER)
MODEL_PRMTOP = "{}/model.prmtop".format(AMBER_INPUT_FOLDER)
AMBER_FOLDER = "./amber"

def parse_and_read_log(user_input_lines):
    geometries_list = []
    #parsing input
    for line in user_input_lines:
        scan_file_name, start, end, period = list(line.split())
        start, end, period = [int(x) for x in [start, end, period]]
        # reading file
        scan_file = GaussianLog(scan_file_name)
        #print(scan_file.summary)
        for scan_step in range(start - 1, end, period):
            print("Reading step {} of {}".format(scan_step + 1, scan_file_name))
            geometries_list.append(scan_file.read_geometry(-1, scan_step))
    print("Total of {} geometries".format(len(geometries_list)))
    return geometries_list

def read_no_high_atoms_list(name):
    gaussian_log = GaussianLog(name)
    input_atoms_list = gaussian_log.symbolic_zmatrix
    no_high_atoms_list = []
    for input_no, input_atom in enumerate(input_atoms_list):
        if "H" in input_atom.layer and "L" not in input_atom.layer:
            no_high_atoms_list.append(input_no)
    return no_high_atoms_list

def read_no_high_link_atoms_list(name):
    gaussian_log = GaussianLog(name)
    input_atoms_list = gaussian_log.symbolic_zmatrix
    no_high_link_atoms_list = []
    for input_no, input_atom in enumerate(input_atoms_list):
        if "H" in input_atom.layer:
            no_high_link_atoms_list.append(input_no)
    return no_high_link_atoms_list

def create_gaussian_sp():
    # reading scan log info
    gaussian_log_name = user_input_lines[0].split()[0]
    no_high_link_atoms_list = read_no_high_link_atoms_list(gaussian_log_name)
    # reading geometries
    geometries_list = parse_and_read_log(user_input_lines)
    # create folder to put sp inputs
    os.makedirs(GAUSSIAN_SP_FOLDER)
    sp_jobs_list=[]
    # criar inputs de gaussian sp para o resp apenas com a camada alta
    for no, atoms_list in enumerate(geometries_list): 
        gaussian_sp_input_name = "gaussian_sp_{:02d}.com".format(no+1)
        sp_jobs_list.append(gaussian_sp_input_name)
        gaussian_sp_file = EmptyGaussianCom(gaussian_sp_input_name)
        gaussian_sp_file.route_section = RESP_ROUTE_SECTION
        gaussian_sp_file.multiplicity_line = CHARGE_AND_MULTIPLICITY
        # choose high layer and link atoms
        high_link_atoms_list = []
        for no in no_high_link_atoms_list:
            high_link_atoms_list.append(atoms_list[no])
        gaussian_sp_file.atoms_list = high_link_atoms_list  
        # write
        gaussian_sp_file.write_to_file("{}/{}"
                            .format(GAUSSIAN_SP_FOLDER,gaussian_sp_input_name))
    #write bash script to run everything
    with open(RUN_SP_SCRIPT_NAME, 'w') as script_file:
        for job in sp_jobs_list:
            script_file.write("g09 {}\n".format(job))
    return None

def create_resp_input():
    #### Read sp_log and make a RESP calculation ######
    gaussian_scan_log_name = user_input_lines[0].split()[0]
    gaussian_scan_log = GaussianLog(gaussian_scan_log_name)
    qmmm_atoms_list = gaussian_scan_log.symbolic_zmatrix
    sp_names_list = os.listdir(GAUSSIAN_SP_FOLDER)
    sp_log_names_list = sorted([log for log in sp_names_list if "log" in log])
    # Create RESP Folder
    os.makedirs(RESP_FOLDER)
    #Create Resp files
    resp_jobs_list = []
    for no, sp_log_name in enumerate(sp_log_names_list):
        complete_sp_log_name = "{}/{}".format(GAUSSIAN_SP_FOLDER, sp_log_name)
        # Set filenames
        #input
        resp_dat = 'resp_{0:02d}.dat'.format(no)
        complete_resp_dat = '{}/{}'.format(RESP_FOLDER, resp_dat)
        resp_qin = 'resp_{0:02d}.qin'.format(no)
        complete_resp_qin = '{}/{}'.format(RESP_FOLDER, resp_qin)
        resp_in = 'resp_{0:02d}.in'.format(no)
        complete_resp_in = '{}/{}'.format(RESP_FOLDER, resp_in)
        #output
        resp_out = 'resp_{0:02d}.out'.format(no)
        resp_pch = 'resp_{0:02d}.pch'.format(no)
        resp_stdout = 'resp_{0:02d}.log'.format(no)
        # Creat RESP instructions and qmmmm atoms list with high and link atoms
        resp_instructions = []
        qmmm_high_atoms_list = []
        for atom in qmmm_atoms_list:
            if 'H' in atom.layer:
                qmmm_high_atoms_list.append(atom)
                if atom.layer[0] == 'H':
                    instruction = '0'
                    if atom.element == 'Mg':
                        instruction = '-99'        #hack    
                else:
                    instruction = '-99'
                resp_instructions.append(instruction)
        produce_resp_dat_from_gaussian_log(complete_resp_dat, complete_sp_log_name)
        produce_resp_qin(complete_resp_qin, qmmm_high_atoms_list)
        produce_resp_in(complete_resp_in, qmmm_high_atoms_list, resp_instructions)
        command = 'resp -O -i {} -o {} -e {} -p {} -q {} > {}\n'.format(\
        resp_in, resp_out, resp_dat, resp_pch, resp_qin, resp_stdout)
        resp_jobs_list.append(command)
    #write bash script to run everything
    with open(RUN_RESP_SCRIPT_NAME, 'w') as script_file:
        for job in resp_jobs_list:
            script_file.write(job)
    return None

def create_amber_input():
    #read model files
    model_coordinates = read_crd_file(MODEL_INPCRD)
    geometries_list = parse_and_read_log(user_input_lines)
    #read model prmtop
    with open(MODEL_PRMTOP, 'r', encoding='UTF-8') as model_prmtop_file:
        model_prmtop_lines = model_prmtop_file.readlines()
        for no, line in enumerate(model_prmtop_lines):
            if 'FLAG CHARGE' in line:
                start_charges = no + 2
                break
    model_charges = read_prmtop_charges(MODEL_PRMTOP)
    # read the number of high and link atoms
    gaussian_log_name = user_input_lines[0].split()[0]
    no_high_link_atoms_list = read_no_high_link_atoms_list(gaussian_log_name)
    no_high_atoms_list = read_no_high_atoms_list(gaussian_log_name)
    # create restraint mask
    restraint_mask = "@"
    jump_this = []
    for index, atom_no in enumerate(no_high_link_atoms_list):
        if atom_no in jump_this:
            pass
        else:
            restraint_mask += str(atom_no)
            sequence = False
            last_sub_atom = atom_no
            for sub_atom_no in no_high_link_atoms_list[index+1:]:
                if sub_atom_no != last_sub_atom + 1:
                    if not sequence:
                        restraint_mask += ','
                        break
                    elif sequence:
                        restraint_mask += '-{},'.format(last_sub_atom)
                        break
                else:
                    if sub_atom_no == no_high_link_atoms_list[-1]:
                        restraint_mask += '-{}'.format(sub_atom_no)
                        jump_this.append(sub_atom_no)
                    else:
                        jump_this.append(sub_atom_no)
                        last_sub_atom = sub_atom_no
                        sequence = True
    for step, atoms_list in enumerate(geometries_list):
        folder_name = "{}/{:02d}".format(AMBER_FOLDER, step)
        os.makedirs(folder_name)
        # write coordinate file
        coordinates_list = [(atom.x, atom.y, atom.z) for atom in atoms_list]
        no_atoms =len(coordinates_list)
        all_coordinates_list = coordinates_list + model_coordinates[no_atoms:]
        crd_name = "{}/coordinates.inpcrd".format(folder_name, step)
        write_crd_file(crd_name, all_coordinates_list)
        #read resp new charges model prmtop
        resp_output = "{0}/resp_{1:02d}.out".format(RESP_FOLDER, step)
        new_charges_list = read_resp_out(resp_output) 
        all_new_charges_list = model_charges[:]
        charge_sum_new = 0
        charge_sum_old = 0
        charge_no_link_new = 0
        charge_no_link_old =0
        for index, no in enumerate(no_high_atoms_list):
            charge_no_link_old += all_new_charges_list[no]
            charge_no_link_old += new_charges_list[index]
        for index, no in enumerate(no_high_link_atoms_list):
            charge_sum_old += all_new_charges_list[no]
            charge_sum_new += new_charges_list[index]
            all_new_charges_list[no] = new_charges_list[index]
        print(charge_sum_new, charge_sum_old)
        print(charge_no_link_new,charge_no_link_old)
        # write these charges to a new prmtop
        charges_for_prmtop = [charge * 18.2223 for charge in all_new_charges_list]
        lines_for_prmtop = []
        for no,charge in enumerate(charges_for_prmtop):
            if no % 5 == 0:
                lines_for_prmtop.append("")
            charge_str = "{0:>16.8E}".format(charge)
            lines_for_prmtop[-1] += charge_str
        lines_for_prmtop = [ "".join((line,"\n")) for line in lines_for_prmtop]
        end_charges = start_charges + len(lines_for_prmtop)
        prmtop_lines = model_prmtop_lines[:start_charges] + lines_for_prmtop +\
        model_prmtop_lines[end_charges:]  
        prmtop_name = "{}/prmtop.prmtop".format(folder_name, step)
        with open(prmtop_name,'w') as prmtop_file:
            for line in prmtop_lines:
                prmtop_file.write(line)
        # read and write amber in files
        for amber_in_name in AMBER_INPUT_FILES:
            complete_amber_in_name = "{}/{}".format(AMBER_INPUT_FOLDER,amber_in_name)
            with open(complete_amber_in_name, 'r', encoding='UTF-8') as model_in_file:
                model_file_str = model_in_file.read()
            new_file_str = model_file_str.replace("XXXX", restraint_mask)
            new_file_name = "{}/{}".format(folder_name, amber_in_name) 
            with open(new_file_name, 'w', encoding='UTF-8') as new_in_file:
                new_in_file.write(new_file_str)
def main():
#    create_gaussian_sp()
#    create_resp_input()
    create_amber_input()
    pass

if __name__ == "__main__":
    main()
