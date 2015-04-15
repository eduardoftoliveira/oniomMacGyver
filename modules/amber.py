#!/usr/bin/env python3

import subprocess
import copy


### RESP
def produce_resp_in(esp_in_name, atoms_list, instructions_list, total_charge = False):
    with open(esp_in_name, 'w', encoding='UTF-8') as esp_in_file:
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
    new_atoms_list = copy.deepcopy(old_atoms_list) 
    for index, atom in enumerate(new_atoms_list):
        atom.mm.charge = new_charges[index]
     
    old_charges_sum = new_charges_sum = 0    
    for no, charge in enumerate(new_charges):
        old_charges_sum += old_atoms_list[no].mm.charge
        new_charges_sum += new_atoms_list[no].mm.charge

    diff = new_charges_sum - old_charges_sum

    no_link_atoms = 0.0
    for atom in old_atoms_list:
        if atom.link_mm_type:
            no_link_atoms += 1.0
    
    for atom in new_atoms_list:
        if atom.link_mm_type:
            atom.mm.charge = atom.mm.charge - diff/no_link_atoms

    return new_atoms_list






###CRD file
def write_crd_file(name, coordinate_list, box_info=True, velocities=False):
    with open(name, mode='w', encoding='utf-8') as crd_file:
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
    with open(name, mode='r', encoding='utf-8') as crd_file:
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
    with open(name, 'r', encoding='UTF-8') as prmtop_file:
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
    
    with open(old_prmtop_name, 'r', encoding='UTF-8') as prmtop_file:
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

def extract_from_mdcrd(mdcrd_name, no_atoms, snapshot):
    """ Extract the coordinates from a snapshot of a mdcrd file"""
    mdcrd_file = open(mdcrd_name,'r')
    bytes_per_structure =  ((3*no_atoms)//10)*81 + ((3*no_atoms)%10)*8 
    bytes_to_jump = 81+bytes_per_structure*snapshot+ (snapshot*26)
    mdcrd_file.seek(bytes_to_jump)
    crd_text = mdcrd_file.read(bytes_per_structure)
    crd_text = crd_text.replace('\n','')
    
    crd_numbers = []
    for byte in range(0,len(crd_text),8):
        value = crd_text[byte:byte+8]
        crd_numbers.append(value)
    
    coordinates = []
    for n in range(0,len(crd_numbers),3):
        xyz = tuple([float(no) for no in crd_numbers[n:n+3]])
        coordinates.append(xyz)
    
    mdcrd_file.close()

    return coordinates






