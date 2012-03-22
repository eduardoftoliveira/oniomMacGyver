#!/usr/bin/env python3

### RESP
def produce_resp_in(esp_in_name, atoms_list, instructions_list):
    with open(esp_in_name, 'w', encoding='UTF-8') as esp_in_file:
        comment = esp_in_name.split("/")[-1]
        total_charge = sum([atom.charge for atom in atoms_list])
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
                                    atom.atomic_number, instructions_list[no])
            esp_in_file.write(line)
        esp_in_file.write('\n\n')    
    return None

def produce_resp_qin(resp_qin_name, atoms_list):
    with open(resp_qin_name, 'w', encoding='UTF-8') as resp_qin_file:
        n = 0
        for atom in atoms_list:
            n += 1
            charge_str = '{0:10.6f}'.format(atom.charge)
            if n == 8:
                charge_str += '\n'
                n = 0
            resp_qin_file.write(charge_str)

def produce_resp_dat_from_gaussian_log(esp_dat_name, gaussian_log_name):
    unit = 0.529177249  # 1 ansgtrom = 1 bohr /unit
    with open(gaussian_log_name, 'r', encoding='UTF-8') as gaussian_log_file:
        atomic_center_list = []
        esp_fit_list = []
        fit_list = []
        for line in gaussian_log_file:
            if 'Atomic Center ' in line:
                x = float(line[32:42])/unit
                y = float(line[42:52])/unit
                z = float(line[52:62])/unit
                atomic_center_list.append((x,y,z))
            elif 'ESP Fit ' in line:
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

###CRD file
def write_crd_file(name, coordinate_list):
    with open(name, mode='w', encoding='utf-8') as crd_file:
        amber_crd_lines = ['\n', '  {0}\n'.format(len(coordinate_list)-2)]
        for no in range(0, len(coordinate_list)):
            atom_coordinates = coordinate_list[no][0:3]
            line = '{0[0]:12.7f}{0[1]:12.7f}{0[2]:12.7f}'.format(atom_coordinates)
            if no%2 != 0: line += '\n'
            amber_crd_lines.append(line)
        amber_crd_lines[-1] += '\n'
        for line in amber_crd_lines: 
            crd_file.write(line)
    return None

def read_crd_file(name):
    with open(name, mode='r', encoding='utf-8') as crd_file:
        extended_coordinates_list = []
        coordinates_list = []
        amber_crd_lines = crd_file.readlines()
        for line in amber_crd_lines:
            extended_coordinates_list.extend(line.split())
        extended_coordinates_list.pop(0)
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
