#!/usr/bin/env python

import copy
import numpy as np
import os
import subprocess

BASE_DIR = os.path.dirname(os.path.dirname(__file__))
INPUT_FOLDER = os.path.join(BASE_DIR, "dat/amber/")

def write_amber_in(calc_type, in_name, *args):
    """Writes an Amber input file for a desired type of calculation
    pass any arguments to include in the input as "keyword=value"

    Please see files in dat/amber folder for available calc_types.
    """

    # parse list of arguments
    arg_dict = {}
    for arg in args:
        key, value = arg.split("=")
        arg_dict[key] = value

    template_filename =  os.path.join(INPUT_FOLDER, calc_type)
    with open(template_filename, 'r') as template_file:
        template_lines = template_file.readlines()
    
    # substiture template file parameters
    new_lines = []
    for line in template_lines:
        if '=' in line.split("!")[0]:
            comment=""
            line = line.rstrip()
            if "!" in line:
                line, comment = line.split("!")
                comment = "!" + comment
            t_key, t_value = line.split("=")
            if t_key.strip() in arg_dict:
                t_value = arg_dict[t_key.strip()] + ","
                arg_dict.pop(t_key.strip())
            line = "{0}={1}{2}\n".format(t_key, t_value, comment)
        if "&end" in line:
            for key in arg_dict:
                new_line = "    {0}={1},\n".format(key, arg_dict[key])
                new_lines.append(new_line)
        new_lines.append(line)

    # TODO
    # check if there are missing arguments

    with open(in_name, 'w') as in_file:
        in_file.writelines(new_lines)

### RESP
def produce_resp_in(
        esp_in_name, atoms_list, instructions_list, total_charge = False):
    with open(esp_in_name, 'w') as esp_in_file:
        comment = esp_in_name.split("/")[-1]
        if type(total_charge) == int:
            pass
        else:
            total_charge = sum([atom.mm.charge for atom in atoms_list])
        no_atoms = len(atoms_list)
        esp_in_file.write(\
        """{0}
 &cntrl
  nmol=1
  ihfree=1
  iqopt=2
 &end
1.0
{0}
{1:>5.0f}{2:>5d}\n""".format(comment, total_charge, no_atoms))
        for no, atom in enumerate(atoms_list):
            line = '{0:>5d}{1:>5s}\n'.format(\
                                    atom.atomic_nr, instructions_list[no])
            esp_in_file.write(line)
        esp_in_file.write('\n\n')    
    return None

def produce_resp_qin(resp_qin_name, atoms_list):
    with open(resp_qin_name, 'w', encoding='UTF-8') as resp_qin_file:
        n = 0
        for atom in atoms_list:
            n += 1
            if atom.mm.charge:
                charge_str = '{0:10.6f}'.format(atom.mm.charge)
            else:
                charge_str = '{0:10.6f}'.format(0)
            if n == 8:
                charge_str += '\n'
                n = 0
            resp_qin_file.write(charge_str)

def produce_resp_dat_from_gaussian_log(esp_dat_name, gaussian_log_name, qm_atoms_list):
    """!!!!!!!!!!!!!!!!!!!!!! I THINK THERE IS A BUG IN THIS CODE, CHECK FOR ERRORS IN THE COORDINATES"""
    unit = 0.529177249  # 1 ansgtrom = 1 bohr /unit
    with open(gaussian_log_name, 'r', encoding='UTF-8') as gaussian_log_file:
        atomic_center_list = []
        esp_fit_list = []
        fit_list = []
        for atom in qm_atoms_list:
            atomic_center_list.append((atom.x/unit,atom.y/unit,atom.z/unit))
        for line in gaussian_log_file:
            if 'ESP Fit ' in line:
                x = float(line[32:42])/unit
                y = float(line[42:52])/unit
                z = float(line[52:62])/unit
                esp_fit_list.append((x,y,z))
            elif 'Fit     ' in line:
                esp = float(line[14:24])
                fit_list.append(esp)
        
    with open(esp_dat_name, 'w', encoding='UTF-8') as esp_dat_file:
        first_line = '{0:5d}{1:5d}\n'.format(\
                                    len(atomic_center_list),len(fit_list))
        esp_dat_file.write(first_line)
        for coordinates in atomic_center_list:
            line = '{0[0]:32.6e}{0[1]:16.6e}{0[2]:16.5e}\n'.format(coordinates)
            esp_dat_file.write(line)
            
        for no in range (0,len(fit_list)):
            line = '{0:16.6e}{1[0]:16.6e}{1[1]:16.6e}{1[2]:16.6e}\n'\
            .format(fit_list[no], esp_fit_list[no])            
            esp_dat_file.write(line)                           
        
    return None

def read_resp_out(name):
    with open(name, mode='r', encoding='utf-8') as resp_out_file:
        resp_out_lines = resp_out_file.readlines()
        for no, line in enumerate(resp_out_lines):     
            if 'Point Charges Before' in line:
                start = no + 3
            elif 'Sum over the calculated' in line:
                end = no - 1
                break
        charges_list = []
        for line in resp_out_lines[start:end]:
            charges_list.append(float(line.split()[3])) 
    return charges_list

def give_resp_charges(old_atoms_list, new_charges):
    """writes new charges to the atoms in atom list
    It corrects the overall charge by
    scaling the charges of link atoms"""
    new_atoms_list = copy.copy(old_atoms_list) 
    for index, atom in enumerate(new_atoms_list):
        atom.mm.charge = new_charges[index]
     
    old_charges_sum = new_charges_sum = 0    
    for no, charge in enumerate(new_charges):
        old_charges_sum += old_atoms_list[no].mm.charge
        new_charges_sum += new_atoms_list[no].mm.charge

    diff = new_charges_sum - old_charges_sum

    no_link_atoms = 0.0
    for atom in old_atoms_list:
        if atom.oniom.link_atom:
            no_link_atoms += 1.0
    
    for atom in new_atoms_list:
        if atom.oniom.link_atom:
            atom.mm.charge = atom.mm.charge - diff/no_link_atoms

    return new_atoms_list






###CRD file
def write_crd_file(name, coordinate_list, box_info=True, velocities=False):
    with open(name, mode='w') as crd_file:
        if box_info:
            box_coord = coordinate_list[-2:]
            coordinate_list = coordinate_list[:-2]
        no_atoms = len(coordinate_list)
        if velocities:
            no_atoms = no_atoms//2

        
        first_line = '\n {0}\n'.format(no_atoms)
        amber_crd_lines = [first_line]
        for no, coordinates in enumerate(coordinate_list):
            line = '{0[0]:12.7f}{0[1]:12.7f}{0[2]:12.7f}'.format(coordinates)
            if no%2 != 0:
                amber_crd_lines[-1] += line+'\n'
            else:
                amber_crd_lines.append(line)
        if no%2 != 1:
            amber_crd_lines[-1] += '\n'
        
        if box_info:
            line = '{0[0]:12.7f}{0[1]:12.7f}{0[2]:12.7f}'.format(box_coord[0])
            line +='{0[0]:12.7f}{0[1]:12.7f}{0[2]:12.7f}\n'.format(box_coord[1])
            amber_crd_lines.append(line) 
        for line in amber_crd_lines: 
            crd_file.write(line)
    return None

def read_crd_file(name):
    with open(name, mode='r') as crd_file:
        extended_coordinates_list = []
        coordinates_list = []
        amber_crd_lines = crd_file.readlines()
        for line in amber_crd_lines[2:]:
            for block in range(int(len(line)/12)):
                extended_coordinates_list.append(line[block*12:(block+1)*12])
        extended_coordinates_list = [float(no) for no in extended_coordinates_list]
        for no in range(0,len(extended_coordinates_list),3):
            coordinates_list.append(extended_coordinates_list[no:no+3])
    return coordinates_list

### mdcrd file 
def read_mdcrd_file(name):  #only one structure
    with open(name, mode='r', encoding='utf-8') as crd_file:
        extended_coordinates_list = []
        coordinates_list = []
        amber_crd_lines = crd_file.readlines()
        for line in amber_crd_lines[1:]:
            extended_coordinates_list.extend(line.split())
        extended_coordinates_list = [float(no) for no in extended_coordinates_list]
        for no in range(0,len(extended_coordinates_list),3):
            coordinates_list.append(extended_coordinates_list[no:no+3])
    return coordinates_list

### PRMTOP
def read_prmtop_charges(name):
    with open(name, 'r') as prmtop_file:
        prmtop_lines = prmtop_file.readlines()
        for line in range(0,len(prmtop_lines)):
            if 'FLAG CHARGE' in prmtop_lines[line]:
                current_line = line + 2
                break
        charges_list = []
        while prmtop_lines[current_line][0] != '%':
            charges_list.extend(prmtop_lines[current_line].split())
            current_line += 1
    #convert charges
    for no in range(len(charges_list)):
        charges_list[no] = float(charges_list[no]) / 18.2223
    
    return charges_list

def write_prmtop_charges(old_prmtop_name, new_prmtop_name, charges_list):
    """ write a new prmtop file from a old one with the charges given in charges_list"""
    
    with open(old_prmtop_name, 'r') as prmtop_file:
        model_prmtop_lines = prmtop_file.readlines()
        for line in range(0,len(model_prmtop_lines)):
            if 'FLAG CHARGE' in model_prmtop_lines[line]:
                starting_line = line + 2
                break

    charges_for_prmtop = [charge * 18.2223 for charge in charges_list]
    lines_for_prmtop = []
    for no,charge in enumerate(charges_for_prmtop):
        if no % 5 == 0:
            lines_for_prmtop.append("")
        charge_str = "{0:>16.8E}".format(charge)
        lines_for_prmtop[-1] += charge_str
    lines_for_prmtop = [ "".join((line,"\n")) for line in lines_for_prmtop]
    ending_line = starting_line + len(lines_for_prmtop)
    prmtop_lines = model_prmtop_lines[:starting_line] + lines_for_prmtop +\
    model_prmtop_lines[ending_line:]  
    with open(new_prmtop_name,'w') as new_prmtop_file:
        for line in prmtop_lines:
            new_prmtop_file.write(line)



    
def read_amber_atom_type_list(name):
    with open(name, 'r', encoding='UTF-8') as prmtop_file:
        prmtop_lines = prmtop_file.readlines()
        for line in range(0,len(prmtop_lines)):
            if 'FLAG AMBER_ATOM_TYPE' in prmtop_lines[line]:
                current_line = line + 2 
                break
        atom_type_list = []
        while prmtop_lines[current_line][0] != '%':
            atom_type_list.extend(prmtop_lines[current_line].split())
            current_line += 1
    return atom_type_list

    
    

### out file
def read_out_energies(name, patern="EAMBER (non-restraint)  ="):
    """Read energies from a .out file into a list (with grep)"""
    
    grep_command = "grep '{}' {}".format(patern, name)
    grep_call = subprocess.Popen(grep_command, shell=True, stdout=subprocess.PIPE)
    grep_output = grep_call.stdout.read()
    energies_list = str(grep_output)[1:].replace("EAMBER (non-restraint)  =","").split("\n")
    energies_list = [float(no.strip()) for no in energies_list[:-2]]
    return energies_list

    
#####

def create_restraint_mask(atoms_numbers_list):
    "returns a restraint mask for amber calculations"
    restraint_mask = "@"
    jump_this = []
    for index, atom_no in enumerate(atoms_numbers_list):
        if atom_no in jump_this:
            pass
        else:
            restraint_mask += str(atom_no+1)
            sequence = False
            last_sub_atom = atom_no
            for sub_atom_no in atoms_numbers_list[index+1:]:
                if sub_atom_no != last_sub_atom + 1:
                    if not sequence:
                        restraint_mask += ','
                        break
                    elif sequence:
                        restraint_mask += '-{},'.format(last_sub_atom+1)
                        break
                else:
                    if sub_atom_no == atoms_numbers_list[-1]:
                        restraint_mask += '-{}'.format(sub_atom_no+1)
                        jump_this.append(sub_atom_no)
                    else:
                        jump_this.append(sub_atom_no)
                        last_sub_atom = sub_atom_no
                        sequence = True
    return restraint_mask

##### mdcrd

def extract_from_mdcrd(mdcrd_name, no_atoms, snapshot, 
                       has_box_info = True, output_box_info = False):
    """ Extract the coordinates from a snapshot of a mdcrd file"""
    return extract_many_from_mdcrd(mdcrd_name, no_atoms, init=snapshot, 
            end=snapshot+1, has_box_info=has_box_info, 
            output_box_info=output_box_info)[0]

def extract_many_from_mdcrd(mdcrd_name, no_atoms, init=0, end=1, step=1, 
                       has_box_info = True, output_box_info = False):
    """ Extract the coordinates from snapshots of a mdcrd file"""
    #floats = open(mdcrd_name,'r').read()[81:].replace('\n','')
    #floats = [floats[i:i+8] for i in range(0, len(floats),8)]
    #if has_box_info:
    #    no_atoms += 1
    #    no_floats = (no_atoms)*3
    #    no_steps = len(floats)/no_floats
    #    if not output_box_info:
    #        for i in reversed(range(no_steps)):
    #            del floats[i*no_floats-3:i*no_floats]
    #        no_atoms -= 1
    #        no_floats = (no_atoms)*3

    #floats = np.array(floats, dtype=float)
    #snapshots = floats.reshape(no_steps, no_atoms,3)

    #return snapshots

    mdcrd_file = open(mdcrd_name,'r')
    snapshots = []
    for snapshot in np.arange(init, end, step):
        no_floats = 3*no_atoms
        bytes_per_structure =  ((3*no_atoms)//10)*81

        if ((3*no_atoms)%10)*8:
            bytes_per_structure += ((3*no_atoms)%10)*8 + 1 
    
        if has_box_info:
            bytes_per_structure += 25 # line with box info
    
        bytes_to_jump = 81+bytes_per_structure*snapshot
        mdcrd_file.seek(bytes_to_jump)

        if not output_box_info:
            bytes_per_structure -= 25

        crd_text = mdcrd_file.read(bytes_per_structure)
        crd_text = crd_text.replace('\n','')
    
        coordinates = np.array([float(crd_text[i:i+8]) for i in range(0, len(crd_text),8)])
        coordinates = coordinates.reshape(len(coordinates)/3, 3)
        snapshots.append(coordinates)
    mdcrd_file.close()

    return snapshots

#def extract_many_from_mdcrd(mdcrd_name, no_atoms, init=0, end=1, step=1, 
#                       has_box_info = True, output_box_info = False):
#    """ Extract the coordinates from snapshots of a mdcrd file"""
#    mdcrd_file = open(mdcrd_name,'r')
#    snapshots = []
#    for snapshot in np.arange(init, end, step):
#        no_floats = 3*no_atoms
#        bytes_per_structure =  ((3*no_atoms)//10)*81
#
#        if ((3*no_atoms)%10)*8:
#            bytes_per_structure += ((3*no_atoms)%10)*8 + 1 
#    
#        if has_box_info:
#            bytes_per_structure += 25 # line with box info
#    
#        bytes_to_jump = 81+bytes_per_structure*snapshot
#        mdcrd_file.seek(bytes_to_jump)
#
#        if not output_box_info:
#            bytes_per_structure -= 25
#
#        crd_text = mdcrd_file.read(bytes_per_structure)
#        crd_text = crd_text.replace('\n','')
#    
#        coordinates = np.fromstring(crd_text, count=no_floats).\
#            reshape(no_atoms,3)
#
#        snapshots.append(coordinates)
#        print coordinates
#    mdcrd_file.close()

### TI thermodynamic integration

def write_ti_groupfile(group_filename, amber_nameA, amber_nameB, 
        topA, crdA, topB, crdB):
    "Creates a groupfile for thermodynamic integration calculations"

    contents = "-O -i {0}.in -o {0}.out -r {0}.rst -c {1} -p {2}\n".format(
            amber_nameA, crdA, topA)

    contents += "-O -i {0}.in -o {0}.out -r {0}.rst -c {1} -p {2}\n".format(
            amber_nameB, crdB, topB)

    open(group_filename, 'w').write(contents)

def write_ti_groupfiles(calc_ins, 
        lambda_initial, lambda_final, lambda_step,
        topA, inpcrdA, topB, inpcrdB):

    for step in [1,2,3]:
        for l in np.arange(lambda_initial, lambda_final, lambda_step):
            groupfiles = []
            for calc_no, calc_in in enumerate(calc_ins):
                calc_step_l_name = "{0}_{1}_{2:.2f}".format(
                        calc_in, step, l)

                group_filename = "step_{0}/{1}.groupfile".format(
                        step, calc_step_l_name)

                amber_nameA = "{0}_i".format(calc_step_l_name)
                amber_nameB = "{0}_f".format(calc_step_l_name)
                if calc_no == 0:
                    crdA = inpcrdA
                    crdB = inpcrdB
                else:
                    crdA = "{0}_{1}_{2:.2f}_i.rst".format(
                            calc_ins[calc_no-1], step, l)
                    crdB = "{0}_{1}_{2:.2f}_f.rst".format(
                            calc_ins[calc_no-1], step, l)

                if step == 1:
                    topI = topF = topA
                    crdI = crdF = crdA
                elif step == 2:
                    topI = topA
                    crdI = crdA
                    topF = topB
                    crdF = crdB
                else:
                    topI = topF = topB
                    crdI = crdF = crdB

                write_ti_groupfile(group_filename, amber_nameA, amber_nameB,
                        topI, crdI, topF, crdF)
                groupfiles.append(group_filename)
            write_groupfile_que("{0}/ti.que".format(INPUT_FOLDER), 
                    [2, 8, 8], groupfiles) 


def write_groupfile_que(template_name, list_nslots, groupfiles):

    template_lines = open(template_name, 'r').readlines()
    for no, groupfile in enumerate(groupfiles):
        line = "mpirun -np {0} sander.MPI -ng 2 -groupfile {1}\n".format(
            list_nslots[no], os.path.basename(groupfile))
        template_lines.append(line)

    open("{0}.que".format(groupfile), 'w').writelines(template_lines)




        
