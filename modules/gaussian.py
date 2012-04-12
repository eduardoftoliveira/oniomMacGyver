#!/usr/bin/env python3

# python modules
import collections

# my modules
import atoms


class QmmmAtom(atoms.Atom):
    def __init__(self, element, mm_type, charge, mask, x, y, z, layer):
        super().__init__(element, x, y, z)
        self.mm_type = mm_type
        self.charge = float(charge)
        self.mask = mask
        self.layer = layer

class EmptyGaussianCom():
    def __init__(self, name):
        self.name = name
        self.link_0_commands = ["%nproc=8\n", "%mem=6GB\n", "%chk=default.chk\n"]
        self.route_section = "#\n"
        self.title_line = "title line required\n"
        self.multiplicity_line = ""
        self.atoms_list = []
        self.additional_input_dict = {"connect":[], "modred":[], "gen":[],
                                      "pseudo=read":[]}
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
                if type(atom) == QmmmAtom:
                    atom_type_charge = "{0.element}-{0.mm_type}-{0.charge:.6f}"\
                                        .format(atom)
                    line = ("{0:16s}{1.mask:>2s}{1.x:>14.8f}{1.y:>14.8f}"
                            "{1.z:>14.8f} {1.layer:s}\n"
                            .format(atom_type_charge,atom))
                    gaussian_com_file.write(line)
                else:
                    line = ("{0.element:18s}{0.x:>14.8f}{0.y:>14.8f}"
                    "{0.z:>14.8f}\n".format(atom))
                    gaussian_com_file.write(line)                
            for section in self.additional_input_dict:
                gaussian_com_file.write("\n")
                for line in self.additional_input_dict[section]:
                    gaussian_com_file.write(line)

class GaussianCom(EmptyGaussianCom):
    def __init__(self, name):
            self.name = name
            self.lines = self._read_lines()
            self.blank_lines = self._count_blank_lines()
            self.link_0_commands = self._read_link_0_commands()
            self.route_section = self._read_route_section()
            self.title_line = self._read_title_line()
            self.multiplicity_line = self._read_multiplicity_line()
            self.atoms_list = self._read_atoms()
            self.additional_input_dict = self._read_additional_input()
            self.connectivity_list = self.additional_input_dict["connect"]
            self.modredundant_list = self.additional_input_dict["modred"]
            self.gen_list = self.additional_input_dict["gen"]
            self.pseudo_list = self.additional_input_dict["pseudo=read"]

    def _read_lines(self):
        """Reads lines to a list and strips the \\n"""
        with open(self.name, 'r', encoding='UTF-8') as file:
            lines = file.readlines()
            lines = [line.strip() for line in lines]
        return lines
            
    def _count_blank_lines(self):
        """Return a list with the blank lines number"""
        blank_lines = []
        for no, line in enumerate(self.lines):
            if line == '':
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

    def _read_atoms(self):
        """ Return a list of atoms"""
        if "amber" in self.route_section.lower():
            atoms_list = self._read_qmmm_atoms()
        else:
            atoms_list = self._read_qm_atoms()
        return atoms_list
        
    def _read_qm_atoms(self): 
        """Return a list of qm atoms (element and coordinates only)"""
        atoms_list = []
        for atom_line in self.lines\
        [self.blank_lines[1]+2:self.blank_lines[2]]:
            element, x, y, z = atom_line.split()
            atoms_list.append(atoms.Atom(element, x, y, z))
        return atoms_list

    def _read_qmmm_atoms(self):
        """ Return a list of Qmmm gaussian atoms """
        atoms_list = []
        for line in self.lines [self.blank_lines[1]+2:self.blank_lines[2]]:
            atoms_list.append(self._read_qmmm_atom_line(line))
        return atoms_list

    def _read_additional_input(self):
        """Reads additional input and stores it in a ordered dict"""
        additional_input_dict = collections.OrderedDict(\
        [("connect",None),("modred",None),("gen",None),("pseudo=read",None)])
        shift = 0
        b_lines = self.blank_lines
        for key in additional_input_dict:
            if key in self.route_section.lower():
                i_start, i_finish = b_lines[2+shift]+1,b_lines[3+shift]
                additional_input_dict[key]= self.lines[i_start: i_finish]
                shift += 1
        return additional_input_dict

    def _read_qmmm_atom_line(self, line):
        """ Read atom line and checks for PDB Information"""
        ### check for PDB information
        # Initialize vars as =None
        mm_type = None 
        mm_charge = 0
        if '(' in line and ')' in line:
            pdb_info = line.split("(")[1].split(")")[0]
            pdb_info_list = pdb_info.split(",")
            line.replace("({})".format(pdb_info), "")
            for info in pdb_info_list:
                if 'PDBName' in info:
                    pdb_atom_name = info.split("=")[1]
                if 'ResName' in info:
                    pdb_res_name = info.split("=")[1]
                if 'ResNum' in info:
                    pdb_res_number = info.split("=")[1]
                    if '_' in pdb_res_number : # presence of chain information
                        pdb_res_number, pdb_chain  = info.split("_")
        else:
            pdb_atom_name = pdb_res_name = pdb_res_number = pdb_chain = None
        line_list = line.split(None, 5) 
        ### Atom, MMtype, MMcharge
        atom_info_list = line_list[0].split('-',2) 
        element = atom_info_list[0]
        if len(atom_info_list) > 1 :
            mm_type = atom_info_list[1] 
        if len(atom_info_list) > 2 :
            mm_charge = atom_info_list[2]
        ### XYZ and layer and mask
        if len(line_list) == 4:
            x,y,z = line[1:4]
        elif len(line_list) == 6  : ## Assume mask X Y Z Layer
            mask,x,y,z,layer = line_list[1:6]
        # PDB INFO IS CURRENTLY OMMITED FROM OUTPUT
        qmmm_atom = QmmmAtom(element, mm_type, mm_charge, mask, x, y, z, layer)
        return qmmm_atom


class GaussianLog():
    def __init__(self, name):
        self.name = name
        self.file = open(self.name, 'r')
        self.route_section = self._read_route_section()
        self.amber = "amber" in self.route_section.lower()
        self.steps_list = self._read_steps()
        self.energies_list = self._read_energies()
        self.symbolic_zmatrix = self.read_symbolic_zmatrix()
        self.initial_geometry = self.read_geometry(0, 0)
        self.final_geometry = self.read_geometry(-1, -1)
        self.summary = self._generate_summary()

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
                           
    def _read_steps(self):
        """Creates a two dimensions list with the a tuple corresponding
        to where where the steps start and finish (lines or bytes?)"""
        steps_list = [[]]
        previous_scan_step = scan_step = 0
        opt_step_start = 0
        self.file.seek(0)
        line = self.file.readline()
        while line:
            if "Step number" in line:
                opt_step_finish = self.file.tell()
                steps_list[scan_step].append((opt_step_start, opt_step_finish))
                opt_step_start = self.file.tell()
                if "scan point" in line:
                    scan_step = int(line.split()[12]) - 1 
                    if scan_step != previous_scan_step:
                        steps_list.append([])
                        previous_scan_step = scan_step
            line = self.file.readline()
        steps_list[scan_step].append((opt_step_start, self.file.tell())) # last structure
        self.file.seek(0)
        return steps_list

    def _read_energies(self):
        energies_list = []
        if self.amber:
            search_str = "extrapolated energy"
        else:
            search_str = "SCF Done"
        for scan_step in self.steps_list:
            energies_list.append([])
            for opt_step in scan_step:
                self.file.seek(opt_step[0])
                for line in self.file:
                    if search_str in line:
                        energy = float(line.split()[4])
                    if "Step number" in line:
                        break
                energies_list[-1].append(energy)
        return energies_list
    
    def read_geometry(self, opt_step, scan_step):
        "Returns a list of atoms with the respective coordinates"
        # lines to read
        step_start = self.steps_list[scan_step][opt_step][0]
        self.file.seek(step_start)
        atoms_list = []
        reading = False
        for line in self.file:
            if reading:
                if "-------" in line:
                    break
                else:
                    atomic_number = line.split()[1]
                    x, y, z = line.split()[3:6]
                    element = [key for key in iter(atoms.ATOMIC_NUMBER_DICT) \
                               if atoms.ATOMIC_NUMBER_DICT[key] == int(atomic_number)][0] #hack
                    atoms_list.append(atoms.Atom(element, x, y, z))
            elif " orientation:" in line:
                for _ in range(4): next(self.file)
                reading = True    
        return atoms_list
      
    def read_symbolic_zmatrix(self):
        self.file.seek(0)
        atoms_list = []
        reading = False
        for line in self.file:
            if reading:
                if "Charge" in line:
                    pass
                elif line.strip() == '':
                    break
                else:
                    mm_type_charge, mask, x, y, z, layer = line.split(None,5)[0:6]
                    element, mm_type, charge = mm_type_charge.split('-',2)
                    atoms_list.append(QmmmAtom(element, mm_type, charge, mask,
                                               x, y, z, layer))
            if "Symbolic Z-matrix:" in line:
                reading = True
        return atoms_list
    
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
        {1} atoms: {0.initial_geometry}
        
        Opt Steps: {2}
        Scan Steps: {3}
        
        Last Energy: {4}
        """.format(self, len(self.initial_geometry), no_opts, no_scans, energy)
        return summary
