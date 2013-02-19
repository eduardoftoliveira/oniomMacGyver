#!/usr/bin/env python3

# python modules
import re
import collections
import linecache
import subprocess
from copy import deepcopy

# my python modules
import atoms
import molecules

# my c extensions
try:
    import c_grep
    c_grep_installed = True
except ImportError:
    c_grep_installed = False
if c_grep_installed:
    print("c_grep instalado")
else:
    print("c_grep nao instalado")


class GaussianFile():
    def __init__(self):
        pass

    def read_gaussian_input_structure(self, lines_list):
        atoms_list = []
        for line in lines_list:
            line = line.strip()
            ### check for PDB information
            if '(' in line and ')' in line:
                has_pdb_info = True
                pdb_info = line.split("(")[1].split(")")[0]
                pdb_info_list = pdb_info.split(",")
                line = line.replace("({})".format(pdb_info), "") 
                for info in pdb_info_list:
                    if 'PDBName' in info:
                        pdb_atom_name = info.split("=")[1]
                    if 'ResName' in info:
                        pdb_res_name = info.split("=")[1]
                    if 'ResNum' in info:
                        pdb_res_number = info.split("=")[1]
                        if '_' in pdb_res_number : # presence of chain information
                            pdb_res_number, pdb_chain  = pdb_res_number.split("_")
            else:
                pdb_atom_name = pdb_res_name = pdb_res_number = pdb_chain = ''
                has_pdb_info = False
            line_list = line.split(None) # line has no pdb at this point

            if len(line_list) == 4:
                element, x, y, z = line_list
                this_atom = atoms.Atom(element, x, y, z)
            elif len(line_list) >= 6:
                mm_type_charge, mask, x, y, z, layer = line_list[0:6]
                link_atom_stuff = line_list[6:]
                for i in range(3-len(link_atom_stuff)): 
                    link_atom_stuff.append(None)
                if link_atom_stuff[0] == None:
                    link_element = None
                    link_mm_type = None
                else:
                    link_element, link_mm_type = link_atom_stuff[0].split('-')  # expecting something like "H-HC"
                link_bound_to= link_atom_stuff[1]
                link_scale1  = link_atom_stuff[2]                           # Scale 2 and 3 omitted
                try:
                    element, mm_type, mm_charge = mm_type_charge.split('-',2)
                except ValueError:
                    print("WARNING: Atom no {} does not have all amber info\n".format(len(atoms_list)+1),
                          "        Setting mm_charge to 0 and mm_type to None")
                    element = mm_type_charge.split('-',2)[0]
                    mm_type =  None
                    mm_charge = 0
                if has_pdb_info:
                    if 'pdb_chain' not in locals():
                        pdb_chain = 'Q'
                    this_atom = atoms.QmmmAtomPdb(element, mm_type, mm_charge, mask, x, y, z, layer, pdb_atom_name, pdb_res_name, pdb_res_number, pdb_chain, link_element, link_mm_type, link_bound_to, link_scale1)
                else:
                    this_atom = atoms.QmmmAtom(element, mm_type, mm_charge, mask, x, y, z, layer, link_element, link_mm_type, link_bound_to, link_scale1)
            atoms_list.append(this_atom)
        return atoms_list

    def writeZMat(self,atom):
        if type(atom) == atoms.QmmmAtom:
            atom_type_charge = " {0.element}-{0.mm_type}-{0.charge:.6f}"\
                                .format(atom)
            line = ("{0:18s}{1.mask:>2s}{1.x:>14.8f}{1.y:>14.8f}"
                    "{1.z:>14.8f} {1.layer:s}\n"
                    .format(atom_type_charge,atom))
            return line

        elif type(atom) == atoms.QmmmAtomPdb:
            return atom.get_formatted_line()
        else: 
            line = (" {0.element:18s}{0.x:>14.8f}{0.y:>14.8f}"
                    "{0.z:>14.8f}\n".format(atom))
            return line

    # if QmmmAtomPdb(QmmmAtomPdb)

class EmptyGaussianCom(GaussianFile):
    def __init__(self, name):
        self.name = name
        self.link_0_commands = ["%nproc=8\n", "%mem=6GB\n", "%chk=default.chk\n"]
        self.route_section = "#\n"
        self.title_line = "title line required\n"
        self.multiplicity_line = ""
        self.atoms_list = []
        self.additional_input_dict = {"connect":None, "modred":None, "gen":None,
                                      "pseudo=read":None}
    def write_to_file(self,name):
        with open(name, 'w', encoding='UTF-8') as gaussian_com_file:
            for line in self.link_0_commands:
                gaussian_com_file.write(line)
            gaussian_com_file.write(self.route_section)
            gaussian_com_file.write("\n")   
            gaussian_com_file.write(self.title_line)
            gaussian_com_file.write("\n")
            gaussian_com_file.write(self.multiplicity_line)
            for atom in self.atoms_list:
                    line = self.writeZMat(atom)
                    gaussian_com_file.write(line)                
            for section in self.additional_input_dict:
                if self.additional_input_dict[section]:
                    gaussian_com_file.write("\n")
                    if section == "first":
                        gaussian_com_file.write("\n")
                    for line in self.additional_input_dict[section]:
                        gaussian_com_file.write(line)
            gaussian_com_file.write("\n")

class GaussianCom(EmptyGaussianCom):
    def __init__(self, name):
            self.name = name
            self.lines = self._read_lines()
            self.blank_lines = self._count_blank_lines()
            self.link_0_commands = self._read_link_0_commands()
            self.route_section = self._read_route_section()
            self.title_line = self._read_title_line()
            self.multiplicity_line = self._read_multiplicity_line()
            self.atoms_list = self._read_structure()
            self.additional_input_dict = self._read_additional_input()
            self.connectivity_list = self.additional_input_dict["connect"]
            self.bonds_list = self._read_bonds_list()
            self.modredundant_list = self.additional_input_dict["modred"]
            self.gen_list = self.additional_input_dict["gen"]
            self.pseudo_list = self.additional_input_dict["pseudo=read"]

    def _read_lines(self):
        """Reads lines to a list and strips the \\n"""
        with open(self.name, 'r', encoding='UTF-8') as file:
            lines = file.readlines()
            #lines = [line.strip() for line in lines]
        return lines
            
    def _count_blank_lines(self):
        """Return a list with the blank lines number"""
        blank_lines = []
        for no, line in enumerate(self.lines):
            if line.strip() == '':
                blank_lines.append(no)
        return blank_lines

    def _read_link_0_commands(self):
        """Return a list with Link 0 commands"""
        link_0_commands = []
        for line in self.lines[:self.blank_lines[0]]:
            if '%' in line: link_0_commands.append(line)
        return link_0_commands

    def _read_route_section(self):
        """Return a string with the route section"""
        read_route_section = False
        route_section = ''
        for line in self.lines[:self.blank_lines[0]]:
            if read_route_section:
                route_section += "\n{}".format(line)
            if '#' in line:
                read_route_section = True
                route_section += line
        route_section = route_section
        return route_section

    def _read_title_line(self):
        """Return a string with the title """
        title_line = self.lines[self.blank_lines[0]+1]
        return title_line

    def _read_multiplicity_line(self):
        """Return a string with the multiplicity """
        multiplicity_line = self.lines[self.blank_lines[1]+1]
        return multiplicity_line

    def _read_structure(self):
        """ Return a list of atoms"""
        return self.read_gaussian_input_structure(self.lines[self.blank_lines[1]+2:self.blank_lines[2]])

    def _read_additional_input(self):
        """Reads additional input and stores it in a ordered dict"""
        additional_input_dict = collections.OrderedDict(\
        [("connect",None),("modred",None),("gen",None),("pseudo=read",None),("first",None)])
        shift = 0
        b_lines = self.blank_lines
        for key in additional_input_dict:
            if key in self.route_section.lower():
                if key == "first":
                    shift += 1
                i_start, i_finish = b_lines[2+shift]+1,b_lines[3+shift]
                additional_input_dict[key]= self.lines[i_start: i_finish]
                shift += 1
        return additional_input_dict

    def _read_bonds_list(self):
        """ Create bonds list from the connectivity info on the file"""
        bonds_list = []
        if self.connectivity_list == [] or self.connectivity_list == None:
            return None

        for line in self.connectivity_list:
            numbers = line.split()
            if len(numbers) == 1:
                pass
            else:
                this_atom = self.atoms_list[int(numbers[0])-1]
                other_numbers = numbers[1::]
                for no, number in enumerate(other_numbers):
                    if no%2 ==0: #even
                        other_atom = self.atoms_list[int(number)-1]
                    else:
                        order = other_numbers[no]
                        bond = molecules.Bond(this_atom, other_atom, order)
                        bonds_list.append(bond)
        return bonds_list

    def redo_connectivity_list(self):
        """ Create new connectivity list from the bonds and atoms list"""
        bonds_list = self.bonds_list[:]
        connectivity_list = []
        for index, atom in enumerate(self.atoms_list):
            this_atom_bonds = []
            bonds_to_remove = []
            for no_b, bond in enumerate(bonds_list):
                if atom is bond.atom_a or atom is bond.atom_b:
                    this_atom_bonds.append(bond)
            line = " {0}".format(index+1)
            for bond in this_atom_bonds:
                bonds_list.remove(bond)
                if bond.atom_a is atom:
                    atom_to_put = bond.atom_b
                else:
                    atom_to_put = bond.atom_a
                if atom_to_put in self.atoms_list:
                    line += " {0} {1}".format(self.atoms_list.index(atom_to_put)+1,bond.order)
            line += "\n"
            connectivity_list.append(line)
        
        self.connectivity_list = connectivity_list
        self.additional_input_dict["connect"] = connectivity_list
        return None

class GaussianLog(GaussianFile):
    def __init__(self, name):
        self.name = name
        self.file = open(self.name, 'r')
        self.route_section  = self._read_route_section()
        self.grep_bytes, self._OptimizedParameters     = self._grep_bytes()
        self._sanity_check  = self._sanity_check(self._OptimizedParameters)
        self.energies       = self._read_energies()
        #self.convergency   = self._read_convergency()  # RMS Force, etc...
        self.atoms_list     = self._Zmat_to_atoms_list()
        #self.summary = self._generate_summary()
        self.final_geometry = self.read_geometry(-1, -1)

    def _Zmat_to_atoms_list(self):
        f = open(self.name)
        f.seek(self.grep_bytes['Z-mat'])
        # Skip present line
        f.readline() 
        # Skip charge/multiplicity lines
        while True:
            lastpos = f.tell()
            line = f.readline()
            if 'Charge' not in line:
                break
        f.seek(lastpos)
        Zmat_text = []
        while True:
            line = f.readline()
            test_end = line.strip().replace(' ','')
            if test_end != '':
                Zmat_text.append(line.strip())
            else:
                break
        f.close()
        return self.read_gaussian_input_structure(Zmat_text)

    def _grep_bytes(self): #NOTE: Doesnt work for singlepoints yet. No 'Converged?' string in the output
        self.grep_keywords = [
            'Z-matrix',
            'orientation:',                 # works for both g03 and g09
            'ONIOM: calculating energy.',   # ONIOM energy
            'SCF Done:',
            #'scan point',                   # Not really necessary...
            'Converged?',
            'Step number',                  
            'Optimized Parameters',         # Also reads Non-Opt... 
        ]
        
        grep_bytes = {}
        grep_bytes['orientation:']                  = [[]]
        grep_bytes['ONIOM: calculating energy.']    = [[]]
        grep_bytes['SCF Done:']                     = [[]]
        grep_bytes['Step number']                   = [[]]
        grep_bytes['Converged?']                    = [[]]
        _OptimizedParameters                        = [] #stores the bytes of "Optimized Parameters" to parse it to _sanity_check
        
        if c_grep_installed==False: #usa o grep do linux            

            grep_string=""
            for keywords in self.grep_keywords:
                grep_string += '-e "'+keywords+'" '
                
            grep_output = subprocess.Popen('grep -b ' +  grep_string + self.name , shell=True , stdout=subprocess.PIPE)
            grep_output = grep_output.communicate()[0]
            grep_output = str( grep_output, encoding='utf8' ).splitlines()
            raw_grepped_bytes = []
            for i, line in enumerate(grep_output):
                raw_grepped_bytes.append( (int(line.split(':', 1)[0]), line.split(':', 1)[1]) ) #transforms output into list of tuples
                
        else: #usa o c_grep
            # This will be included in C extension
            raw_grepped_bytes =  c_grep.c_grep(self.name, self.grep_keywords)
            

        for linetuple in raw_grepped_bytes:

            if 'orientation:' in linetuple[1]:
                buffer_orientation = linetuple[0]

            elif 'SCF Done:' in linetuple[1]:
                buffer_SCF_Done = linetuple[0]

            elif 'ONIOM: calculating energy.' in linetuple[1]:
                buffer_ONIOM_calculating_energy = linetuple[0]

            elif 'Step number' in linetuple[1]:
                buffer_Step_number = linetuple[0]

            elif 'Converged?' in linetuple[1]:
                grep_bytes['Converged?'][-1].append(linetuple[0])
                grep_bytes['SCF Done:'][-1].append(buffer_SCF_Done)         # buffered
                grep_bytes['orientation:'][-1].append(buffer_orientation)   # buffered
                grep_bytes['Step number'][-1].append(buffer_Step_number)    # buffered
                
                if 'buffer_ONIOM_calculating_energy' in locals(): #only appends when it is an oniom calculation
                    grep_bytes['ONIOM: calculating energy.'][-1].append(buffer_ONIOM_calculating_energy) #buffered
                    del buffer_ONIOM_calculating_energy

            elif 'Optimized Parameters' in linetuple[1]:
                _OptimizedParameters.append(linetuple[0])
                grep_bytes['ONIOM: calculating energy.'].append([])
                grep_bytes['SCF Done:'].append([])
                grep_bytes['Step number'].append([])
                grep_bytes['Converged?'].append([])
                grep_bytes['orientation:'].append([])

        # Last list may be a ghost
        if grep_bytes['orientation:'][-1] == []:
            for data in grep_bytes:
                grep_bytes[data].pop(-1)

        # Less apearing keywords 
        for linetuple in raw_grepped_bytes:
            if 'Z-matrix' in linetuple[1]:
                grep_bytes['Z-mat'] = int(linetuple[0])
                break
            
        return grep_bytes, _OptimizedParameters

    
    
    def _read_route_section(self):
        """ Returns a string with the route section commands"""
        self.file.seek(0)
        reading = False
        for line in self.file:
            if '#' in line:
                route_section = line
                reading = True
            elif reading:
                if'-------' in line:
                    break
                else:
                    route_section += line
        route_section = route_section.strip()
        return route_section


    def _read_energies(self):
        oniom_loc_bytes = self.grep_bytes['ONIOM: calculating energy.']
        scf_loc_bytes   = self.grep_bytes['SCF Done:']

        ONIOM_extrapol  = []
        ONIOM_model_high= []
        ONIOM_model_low = []
        ONIOM_real_low  = []
        ONIOM_lowlayer_low = []
        SCF_energy = []

        f = open(self.name)
        for complete_opt in oniom_loc_bytes:
            ONIOM_model_high.append([])
            ONIOM_model_low.append([])
            ONIOM_real_low.append([])
            ONIOM_lowlayer_low.append([])
            ONIOM_extrapol.append([])
            for location_byte in complete_opt:
                f.seek(location_byte)
                f.readline() # discard this line
                model_low  = float(f.readline().split('low   system:  model energy:')[1])
                ONIOM_model_low[-1].append(model_low)

                model_high = float(f.readline().split('high  system:  model energy:')[1])
                ONIOM_model_high[-1].append(model_high)

                real_low   = float(f.readline().split('low   system:  real  energy:')[1])
                ONIOM_real_low[-1].append(real_low)

                extrapol   = float(f.readline().split('extrapolated energy =')[1])
                ONIOM_extrapol[-1].append(extrapol)
                
                ONIOM_lowlayer_low[-1].append(real_low-model_low)
        for complete_opt in scf_loc_bytes:
            SCF_energy.append([])
            for location_byte in complete_opt:
                f.seek(location_byte)
                SCF_energy[-1].append(float(f.readline().split('=')[1].split()[0]))

        energies = {}
        energies['ONIOM_extrapol'] = ONIOM_extrapol
        energies['ONIOM_model_high'] = ONIOM_model_high
        energies['ONIOM_lowlayer_low'] = ONIOM_lowlayer_low
        energies['SCF_energy'] = SCF_energy
        return energies


    def _generate_summary(self):
        no_opts = 0
        for scan_step in self.steps_list:
            no_opts += len(scan_step)
        no_scans = len(self.steps_list) - 1
        energy = self.energies_list[-1][-1]       
        summary = """Reading from {0.name}        
        Route Section:
        {0.route_section}
        
        List of Atoms
        {2} atoms: {1}...
        
        Opt Steps: {3}
        Scan Steps: {4}
        
        Last Energy: {5}
        """.format(self, self.initial_geometry[:100], len(self.initial_geometry), no_opts, no_scans, energy)
        return summary
    

    def read_geometry(self, opt_step, scan_step):
        with open(self.name, 'r') as f:
            f.seek(self.grep_bytes['orientation:'][scan_step][opt_step])
            atoms_list = []
            for _ in range(5):
                f.readline()
            for model_atom in self.atoms_list:
                line = f.readline()
                atom = deepcopy(model_atom)
                atomic_number = line.split()[1]
                x, y, z = line.split()[3:6]
                element = [key for key in iter(atoms.ATOMIC_NUMBER_DICT) \
                                if atoms.ATOMIC_NUMBER_DICT[key] == int(atomic_number)][0] #hack
                atom.x, atom.y, atom.z = x,y,z
                atoms_list.append(atom)    
        return atoms_list

    def _sanity_check(self, _OptimizedParameters):  #ve se os passos opt e scanpoint estao consecutivos ou se ficheiro foi danificado entre isso #nos scan ve se optimizaram
    #checks if it is a singlepoint_job or opt_job or scan_job; checks if it is oniom_job
        with open(self.name, 'r') as f:
            if 'oniom' in self.route_section.lower(): oniom_job=True
            else: oniom_job=False
            
            #ver se eh scan, opt ou singlepoint
            if 'opt' in self.route_section.lower(): #not singlepoint; it can be opt_job or scan_job
                singlepoint_job = False
                f.seek(self.grep_bytes['Step number'][0][0])
                stepnr_line = f.readline()
                if 'scan point' in stepnr_line: scan_job = True; opt_job = False
                else: #it is an opt_job
                    scan_job = False; opt_job = True
                    if len(_OptimizedParameters) == 0: print('#WARNING : Unfinished opt job after', stepnr_line.strip('\n'))
                    elif len(_OptimizedParameters) > 1: print('#WARNING : Very odd error. It is supposed to be an opt job but has more than one "Optimized Parameters" keyword')
                    else:
                        f.seek(_OptimizedParameters[0])
                        if "Non-Optimized Parameters" in f.readline(): print('#WARNING : Not fully optimized opt job')
                
                for scanstep, i in enumerate(self.grep_bytes['Step number']):
                    for optstep, i in enumerate(self.grep_bytes['Step number'][scanstep]):
                        f.seek(self.grep_bytes['Step number'][scanstep][optstep])
                        step_line = f.readline()
                        opt_step_line = int(step_line.split()[2])
                        if optstep > 0:
                            if opt_step_line != previous_opt_step_line+1:
                                print('#WARNING : Unconsecutive opt steps! File might be damaged betwen:')
                                f.seek(self.grep_bytes['Step number'][scanstep][optstep-1])
                                print(f.readline(), "\n and \n", step_line)
                        previous_opt_step_line = opt_step_line
                    f.seek(self.grep_bytes['Step number'][scanstep][-1])
                    stepnr_line = f.readline()
                    if scan_job == True: # if it is a scan job, checks if scan steps are consecutive; if it is fully optimized
                        scan_step_line = int(stepnr_line.split()[12])
                        if scanstep > 0:
                            if scan_step_line != previous_scan_step_line+1:
                                print('#WARNING : Unconsecutive scan steps! File might be damaged betwen:')
                                f.seek(self.grep_bytes['Step number'][scanstep][-1])
                                print(f.readline(), "\n and \n", stepnr_line)
                        previous_scan_step_line = scan_step_line
                        
                        #checks if scan step was fully optimized and if scan_job finished prematurely
                        try:
                            f.seek(_OptimizedParameters[scanstep])
                            if "Non-Optimized Parameters" in f.readline():
                                print('#WARNING :', stepnr_line.strip('\n'), ' - NOT Fully Optimized'),
                        except IndexError:
                            print('#WARNING : Unfinished scan job. Ended after', stepnr_line.strip('\n'))
                        
                    elif len(self.grep_bytes['Step number']) > 1: print("#WARNING : Doesn't seem to be a scan job, however GaussianLog read it as such!") #for very odd errors only

            else: singlepoint = True, print('#WARNING : Not checking singlepoint sanity yet!') #for singlepoint_job