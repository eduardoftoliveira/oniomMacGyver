#!/usr/bin/env python

# python modules
import re
import collections
import subprocess
import linecache
import pickle
from copy import deepcopy
from hashlib import md5
from os.path import exists as hazfile
from os.path import getsize
from sys import stderr


# our python modules
import atoms
import molecules
import iolines
import misc

def gen_md5sum(input_text_string):
    md5sum = md5() 
    md5sum.update(input_text_string.encode()) # encode is coz of python3 stuff
    return md5sum.hexdigest()

class ModRed():

    def __init__(self, line = None):
        self.coordtype = None # B, A or D
        self.atomids = [] # list of ints
        self.action = None # (F)reeze, (S)can, (K)ill, (B)uild, (A)ctivate
        # for (S)can only
        self.scan_num_pts = None 
        self.scan_step_sz = None 
        if line:
            self.add_line(line)

    def add_line(self, line):
        coord_numat = {'B':2, 'A':3, 'D':4} # num atomids for bond, angle...
        #action_numpar = {'S':2, 'F':0, 'B':0, 'A':0, 'K':0, 'D':0, 'H':1}
        fields = line.split()
        self.coordtype = fields[0]
        k = 1
        for i in range(coord_numat[self.coordtype]):
            self.atomids.append(int(fields[k]))
            k += 1
        self.action = fields[k]
        k += 1
        if self.action == 'S': # implement H somtime
            self.scan_num_pts = int(fields[k]) #num_steps
            k += 1
            self.scan_step_sz = float(fields[k]) #size_step 

class EmptyGaussianCom():
    def __init__(self, name):
        self.name = name
        self.link_0_commands = ["%nproc=8\n", "%mem=6GB\n", "%chk=default.chk\n"]
        self.route_section = "#\n"
        self.title_line = "title line required\n"
        self.multiplicity_line = ""
        self.atoms_list = []
        self.additional_input_dict = {"connect":None, "readopt":None, "modred":[], "gen":None,
                "pseudo=read":None, "dftb=read":None } #TODO put all empty lists?
    def write_to_file(self,name):
        with open(name, 'w') as gaussian_com_file:
            for line in self.link_0_commands:
                gaussian_com_file.write(line)
            gaussian_com_file.write(self.route_section)
            gaussian_com_file.write("\n")   
            gaussian_com_file.write(self.title_line)
            gaussian_com_file.write("\n")
            gaussian_com_file.write(self.multiplicity_line)
            for atom in self.atoms_list:
                line = iolines.atom2zmat(atom)
                gaussian_com_file.write(line)                
            for section in self.additional_input_dict:
                if self.additional_input_dict[section]:
                    gaussian_com_file.write("\n")
                    if section == 'first' and 'soft' in self.route_section:
                        gaussian_com_file.write("\n")
                    elif section == 'dftb=read' and 'dftb=read' in self.route_section.lower():
                        gaussian_com_file.write("\n")
                    for line in self.additional_input_dict[section]:
                        gaussian_com_file.write(line)
            gaussian_com_file.write("\n\n\n\n\n")

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
            self.additional_input_dict = self._read_additional_input2()            
            self.connectivity_list = self.additional_input_dict["connect"]
            self.bonds_list = self._read_bonds_list()                          #Nao sei para que serve o bonds list, eh diferente de connectivity
            self.modredundant_list = self.additional_input_dict["modred"]
            self.gen_list = self.additional_input_dict[" gen"]
            self.pseudo_list = self.additional_input_dict["pseudo=read"]
            #self.dftb=read = self.additional_input_dict["dftb=read"]      #adicionar isto
            self.MM_external_params = self.additional_input_dict["first"]

    def _read_lines(self):
        """Reads lines to a list and strips the \\n"""
        with open(self.name, 'r' ) as file:
            lines = file.readlines()
            #lines = [line.strip() for line in lines]
        return lines
            
    def _count_blank_lines(self):
        """Return a list with the blank lines number"""
        blank_lines = []
        for no, line in enumerate(self.lines):
            if line.strip() == '':
                blank_lines.append(no)
        return blank_lines #lista de index das blank lines

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
                #route_section += "\n{}".format(line)
                route_section += line
                pass
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
        atoms_list = []
        for line in self.lines[self.blank_lines[1]+2:self.blank_lines[2]]:
            atoms_list.append(iolines.zmat2atom(line))
        return atoms_list

    def _read_additional_input2(self):
        """Reads additional input and stores it in a ordered dict"""
        additional_input_dict = collections.OrderedDict(\
        [("connect",None),("readopt",None),("modred", []),(" gen",None),("pseudo=read",None),("first",None), ("dftb=read",None) ]) #TODO put all empty lists? usefull for extend
        shift=0
        b_lines = self.blank_lines
        print 'route_section:',self.route_section

        for key in additional_input_dict:
            if key in self.route_section.lower().replace("only","first"):
                if key == "modred" and "modred" in self.route_section.lower():
                    i_start, i_finish = b_lines[2+shift]+1,b_lines[3+shift]
                    additional_input_dict[key]= self.lines[i_start: i_finish]
                    #NOTA: ao ler isto, adicionar tb ah lista modredundant_list
                if key == "first" and "soft" in self.route_section.lower():
                    shift += 1
                    i_start, i_finish = b_lines[2+shift]+1,b_lines[3+shift]
                    additional_input_dict[key]= self.lines[i_start: i_finish]
                #print(key, i_start, i_finish)
                #dftb=read
                elif key == "dftb=read" and "dftb=read" in self.route_section.lower():
                #fiz elif para ver se os estragos que causo sao mais contidos... mas devia ser if pk pode haver as 2 keys em simultaneo
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

class GaussianLog():
    def __init__(self, name):
        self.name = name
        self.file = open(self.name, 'r')
        self.route_section  = self._read_route_section()
        self.modreds = self._read_modred()

        self.grep_keywords = self._set_grep_keywords()

        # make a function for this
        (donebytes, bytelist) = self._check_bytelist()
        bytelist = self._grep_bytelist(bytelist, donebytes)
        self.bytedict = self.bytelist2dict(bytelist)
        self.grep_bytes = self.bytedict # stupid thing to do

        # Insanity check
        #self._sanity_check  = self._sanity_check(self.bytedict['Optimized Parameters'][0])

        # Load stuff automatically
        self.energies       = self._read_energies()
        #self.convergency   = self._read_convergency()  # RMS Force, etc...
        self.atoms_list     = self._Zmat_to_atoms_list()
        #self.summary = self._generate_summary()
        self.final_geometry = self.read_geometry(-1, -1)
        self._save_bytelist(bytelist, self._gen_signature())
        self.close_file()

    def _set_grep_keywords(self):
        grep_keywords = [
            'atrix:',
            'orientation:',                 # works for both g03 and g09
            'ONIOM: calculating energy.',   # ONIOM energy
            'SCF Done:',
            'Converged?',
            'Step number',                  
            'Optimized Parameters',        # Also reads Non-Opt... 
            'Delta-x Convergence Met',     # For IRC
            'CORRECTOR']                  # For IRC
        return grep_keywords

    def _read_zmat(self, locbyte):
        self.file.seek(locbyte)
        self.file.readline()                             # skip line 
        while True:                              # skip multiplicity linee{4:4s}
            line = self.file.readline()
            if 'Charge' not in line:
                break
        Zmat_text = [line]
        while True:
            line = self.file.readline()
            if line.strip() != '':
                Zmat_text.append(line.strip())
            else:
                break

        # generate md5sum
        self.zmat_md5sum = md5() 
        self.zmat_md5sum.update(''.join(Zmat_text).encode())
        self.zmat_md5sum = self.zmat_md5sum.hexdigest()

        return Zmat_text

    def _Zmat_to_atoms_list(self):
        Zmat_text = self._read_zmat(self.bytedict['Z-mat'][0][0])

        atoms_list = []
        for line in Zmat_text:
            atoms_list.append(iolines.zmat2atom(line))
        return atoms_list

    def _check_bytelist(self):
        """check if bytelist file exists and matches current log"""

        # haz file?
        bytelist_filename = '%s.bytelist' % self.name
        if not hazfile(bytelist_filename): 
            stderr.write('Bytelist: no file\n')
            return (0, [])

        # load bytelist
        bytelist, signature = self._read_bytelist()

        """# check only if last xyz matches with byte, then if md5sum matches fingerprint """
        # check z-mat byte and md5sum
        for byte, key in bytelist:
            if key == 'atrix:':
                zmat_byte = byte
                break
        self.file.seek(zmat_byte)
        if 'atrix:' not in self.file.readline(): # no match 
            stderr.write('Bytelist: NO match (z-matrix byte seek)\n')
            return (0, []) 
        else:
            tentative_zmat = self._read_zmat(zmat_byte)
            if self.zmat_md5sum != signature[1]:
                stderr.write('Bytelist: NO match (z-matrix md5sum)\n')
                return (0, [])

        # check route_section md5sum
        if self.routesection_md5sum != signature[0]:
            stderr.write('Bytelist: NO match (route_section md5sum)\n')
            return (0, [])

        if signature[3] > getsize(self.name):
            stderr.write('Bytelist: NO match (log is smaller then expected)\n')
            return (0, [])

        # bytelist total match if md5sum for lastxyz and sizeof match signature 
        """get coords"""
        atomidx = [i for i in range(len(tentative_zmat))] # num atoms
        for (byte, key) in bytelist[::-1]:
            if key == 'orientation:':
                last_xyz_byte = byte
                break
        last_xyz =  self.read_coordinates(atomidx, last_xyz_byte)
        txt = ''.join(['%12.6f%12.6f%12.6f\n' % xyz for xyz in last_xyz])

        # Full Match?
        if gen_md5sum(txt) == signature[2] and getsize(self.name) == signature[3]:
            stderr.write('Bytelist: full signature match\n')
            return (signature[3], bytelist)
        
        # Partial match
        for (byte, key) in bytelist:
            self.file.seek(byte)
            if not key in self.file.readline():
                stderr.write('Bytelist: NO match (%s)\n' % grep_key)
                return (0, [])

        # if everything is OK
        stderr.write('Bytelist: %5.1f%% complete\n' % (100.0*signature[3]/getsize(self.name)))
        return (signature[3], bytelist)


    def _read_bytelist(self):
        bytelist_filename = '%s.bytelist' % self.name
        with open(bytelist_filename, 'rb') as bl:
            bytelist = pickle.load(bl)
        signature = bytelist.pop(-1)
        return bytelist, signature

    def _save_bytelist(self, bytelist, signature):
        bytelist_filename = '%s.bytelist' % self.name
        bytelist.append(signature)
        with open(bytelist_filename, 'wb') as bl:
            pickle.dump(bytelist, bl, protocol=2) # protocol=3 : python >= 3.0

    def _grep_bytelist(self, bytelist, done_bytelist_offset): 
        """       
        NOTE: Doesnt work for singlepoints yet. No 'Converged?' string in the output
        
        """

        if done_bytelist_offset == getsize(self.name):
            return bytelist

        grep_string=""
        for keywords in self.grep_keywords:
            grep_string += '-e "'+keywords+'" '

        # Grep 
        if done_bytelist_offset:
            grep_output = subprocess.Popen(
                'tail -c +%d %s| grep -b %s' % (
                    done_bytelist_offset + 1, self.name, grep_string),
                shell=True, stdout=subprocess.PIPE)
        else:
            grep_output = subprocess.Popen('grep -b ' +  grep_string + self.name , shell=True , stdout=subprocess.PIPE)

        # process grep
        grep_output = grep_output.communicate()[0]
        #grep_output = str( grep_output).splitlines()
        grep_output = grep_output.decode("utf8").splitlines() 
        raw_grepped_bytes = []
        for line in grep_output:
            byte = int(line.split(':', 1)[0]) + done_bytelist_offset
            line = line.split(':', 1)[1] 
            for key in self.grep_keywords:
                if key in line:
                    bytelist.append((byte, key))
                    break 
        # keep only keywords from the line
        return bytelist
            

    def bytelist2dict(self, bytelist):
        bytedict = {}
        for key in self.grep_keywords:
            bytedict[key] = [[]] 
        buffer_ONIOM_calculating_energy = False
        for (byte, key) in bytelist:
            if key == 'orientation:':
                buffer_orientation = byte
            elif key == 'SCF Done:':
                buffer_SCF_Done = byte
            elif key == 'ONIOM: calculating energy.':
                buffer_ONIOM_calculating_energy = byte
            elif key == 'Step number':
                buffer_Step_number = byte
            elif key == 'Converged?' or key == "CORRECTOR":
                bytedict['Converged?'][-1].append(byte)
                bytedict['SCF Done:'][-1].append(buffer_SCF_Done)         # buffered
                bytedict['orientation:'][-1].append(buffer_orientation)   # buffered
                bytedict['Step number'][-1].append(buffer_Step_number)    # buffered
                # now, append if oniom only
                if buffer_ONIOM_calculating_energy: 
                    bytedict['ONIOM: calculating energy.'][-1].append(
                        buffer_ONIOM_calculating_energy) #buffered
                    buffer_ONIOM_calculating_energy = False
            elif key == 'Optimized Parameters' or key == "Delta-x Convergence Met":
                bytedict['Optimized Parameters'][0].append(byte)
                bytedict['ONIOM: calculating energy.'].append([])
                bytedict['SCF Done:'].append([])
                bytedict['Step number'].append([])
                bytedict['Converged?'].append([])
                bytedict['orientation:'].append([])

        # Last list may be a ghost
        if bytedict['orientation:'][-1] == []:
            for data in bytedict:
                bytedict[data].pop(-1)

        # Less apearing keywords 
        for (byte, key) in bytelist:
            if key == 'atrix:':
                bytedict['Z-mat'] = [[byte]]
                break

        # Exchange "ard orientation:" for "orientation:" backwards compatible
        #bytedict['orientation:'] = bytedict['orientation:'] 

        return bytedict

        # add signature: route_section + zmat + last_xyz + filesize
    def _gen_signature(self):
        atomidx = [i for i in range(len(self.atoms_list))]
        last_xyz_byte = self.bytedict['orientation:'][-1][-1]
        lastxyz = self.read_coordinates(atomidx, last_xyz_byte)
        lastxyz = ''.join(['%12.6f%12.6f%12.6f\n' % xyz for xyz in lastxyz])
        return (
            self.routesection_md5sum,
            self.zmat_md5sum,
            gen_md5sum(lastxyz),
            getsize(self.name))
    
    def _read_route_section(self):
        """
        This needs to become a class 
        Returns a string with the route section commands"""
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

        md5sum = md5()
        md5sum.update(route_section.encode())
        self.routesection_md5sum = md5sum.hexdigest()

        return route_section

    def _read_modred(self):
        if 'modr' not in self.route_section.lower():
            return None
        MAXLINES = 200*1000
        self.file.seek(0)
        read = False
        modreds = []
        k = 0
        for line in self.file:
            k += 1
            if read:
                if len(line.strip()) == 0 or line.startswith(' I='):
                    return modreds
                else:
                    modreds.append(ModRed(line))
            if line.startswith(' The following ModRedundant'):
                read = True
            if k > MAXLINES: # to prevent long waits
                stderr.write('WARNING: missed ModRed in _read_modred()')
                return 'Failed'
        # EOF...
        stderr.write('WARNING: missed ModRed in _read_modred()')
        return 'Failed'

    def _read_energies(self):
        oniom_loc_bytes = self.bytedict['ONIOM: calculating energy.']
        scf_loc_bytes   = self.bytedict['SCF Done:']

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
                model_low  = misc.starfloat(f.readline().split('low   system:  model energy:')[1])
                ONIOM_model_low[-1].append(model_low)

                model_high = misc.starfloat(f.readline().split('high  system:  model energy:')[1])
                ONIOM_model_high[-1].append(model_high)

                real_low   = misc.starfloat(f.readline().split('low   system:  real  energy:')[1])
                ONIOM_real_low[-1].append(real_low)

                extrapol   = misc.starfloat(f.readline().split('extrapolated energy =')[1])
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


    def close_file(self):
        self.file.close()
    
    ### def read_symbolic_zmatrix(self):
    ###     self.file.seek(0)
    ###     reading = False
    ###     atoms_lines = []
    ###     for no, line in enumerate(self.file):
    ###         if reading:
    ###             if "Charge" in line:
    ###                 pass
    ###             elif line.strip() == '':
    ###                 break
    ###             else:
    ###                 atoms_lines.append(line)
    ###         if "atrix:" in line:
    ###             reading = True
    ###     return self.read_gaussian_input_structure(atoms_lines)
    
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
    
    def read_coordinates(self, atom_nr, byte):
        """To request or not to request N_ATOMS, it would allow checking -----"""

        bytesOFF = 383 # between "orientation" line and 1st atom X coordinate
        offset = byte + bytesOFF

        # What atom indexes?
        if atom_nr in ['*', 'all']:
            idx = [i for i in range(len(self.atoms_list))] # must have been initialized
        elif type(atom_nr) == int:
            idx = [atom_nr]
        elif type(atom_nr) == list:
            idx = atom_nr
        else:
            raise RuntimeError('atom_nr must be */all, int, or list of ints')

        coords = []
        with open(self.name, 'r') as f:
            f.seek(byte-1)
            if f.read(1) != '\n':
                byte = byte - 1
                stderr.write('WARNING: grep -b 1 byte ahead\n')

            for i in idx:
                f.seek(offset + i*71)
                x = float(f.read(12))
                y = float(f.read(12))
                z = float(f.read(12))
                coords.append((x,y,z))
        return coords

    def read_converged(self, byte):

        OFF = 60
        LINE_OFF = 56 
        LABEL_START = 1
        VALUE_START = 26 
        THRESH_START = 39 
        NCHARS_LABEL = 20
        NCHARS_FLOAT = 8
        stop_label = 'Predicted change in '
        short_labels = {
            'Maximum Force       ': 'Max F',
            'RMS     Force       ': 'rms F',
            'Maximum Displacement': 'Max D',
            'RMS     Displacement': 'rms D',
            'Maximum MM Force    ': 'MaxMM',
            'RMS     MM Force    ': 'rmsMM'
        }

        labels = []
        values = []
        thresholds = []

        # correct byte
        f = open(self.name)
        f.seek(byte-1)
        if f.read(1) != '\n':
            byte = byte - 1
            stderr.write('WARTING: grep -b 1 byte ahead\n')

        for i in range(7):
            off = byte + OFF + i*LINE_OFF
            f.seek(off + LABEL_START)
            label = f.read(NCHARS_LABEL)
            if label == stop_label:
                f.close()
                return (labels, values, thresholds)
            labels.append(short_labels[label])
            f.seek(off + VALUE_START)
            values.append(misc.starfloat(f.read(NCHARS_FLOAT)))
            f.seek(off + THRESH_START)
            thresholds.append(misc.starfloat(f.read(NCHARS_FLOAT)))

        # if here, stop_label not found
        f.close()
        error_msg = 'Expected %s after Converged section' % stop_label
        print(labels, values, thresholds)
        raise RuntimeError(error_msg)

    def read_geometry(self, opt_step, scan_step):

        with open(self.name, 'r') as f:
            f.seek(self.bytedict['orientation:'][scan_step][opt_step])
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
                atom.x, atom.y, atom.z = float(x),float(y),float(z)
                atoms_list.append(atom)    
        return atoms_list

    def _sanity_check(self, _OptimizedParameters):
        """"
        #ve se os passos opt e scanpoint estao consecutivos ou se ficheiro foi danificado entre isso #nos scan ve se optimizaram
        #checks if it is a singlepoint_job or opt_job or scan_job; checks if it is oniom_job
        """
        with open(self.name, 'r') as f:
            if 'oniom' in self.route_section.lower(): oniom_job=True
            else: oniom_job=False
            
            #ver se eh scan, opt ou singlepoint
            if 'opt' in self.route_section.lower(): #not singlepoint; it can be opt_job or scan_job
                singlepoint_job = False
                f.seek(self.bytedict['Step number'][0][0])
                stepnr_line = f.readline()
                if 'scan point' in stepnr_line: scan_job = True; opt_job = False
                else: #it is an opt_job
                    scan_job = False; opt_job = True
                    if len(_OptimizedParameters) == 0: print('#WARNING : Unfinished opt job after', stepnr_line.strip('\n'))
                    elif len(_OptimizedParameters) > 1: print('#WARNING : Very odd error. It is supposed to be an opt job but has more than one "Optimized Parameters" keyword')
                    else:
                        f.seek(_OptimizedParameters[0])
                        if "Non-Optimized Parameters" in f.readline(): print('#WARNING : Not fully optimized opt job')
                
                for scanstep, i in enumerate(self.bytedict['Step number']):
                    for optstep, i in enumerate(self.bytedict['Step number'][scanstep]):
                        f.seek(self.bytedict['Step number'][scanstep][optstep])
                        step_line = f.readline()
                        opt_step_line = int(step_line.split()[2])
                        if optstep > 0:
                            if opt_step_line != previous_opt_step_line+1:
                                print('#WARNING : Unconsecutive opt steps! File might be damaged betwen:')
                                f.seek(self.bytedict['Step number'][scanstep][optstep-1])
                                print(f.readline(), "\n and \n", step_line)
                        previous_opt_step_line = opt_step_line
                    f.seek(self.bytedict['Step number'][scanstep][-1])
                    stepnr_line = f.readline()
                    if scan_job == True: # if it is a scan job, checks if scan steps are consecutive; if it is fully optimized
                        scan_step_line = int(stepnr_line.split()[12])
                        if scanstep > 0:
                            if scan_step_line != previous_scan_step_line+1:
                                print('#WARNING : Unconsecutive scan steps! File might be damaged betwen:')
                                f.seek(self.bytedict['Step number'][scanstep][-1])
                                print(f.readline(), "\n and \n", stepnr_line)
                        previous_scan_step_line = scan_step_line
                        
                        #checks if scan step was fully optimized and if scan_job finished prematurely
                        try:
                            f.seek(_OptimizedParameters[scanstep])
                            if "Non-Optimized Parameters" in f.readline():
                                print('#WARNING :', stepnr_line.strip('\n'), ' - NOT Fully Optimized'),
                        except IndexError:
                            print('#WARNING : Unfinished scan job. Ended after', stepnr_line.strip('\n'))
                        
                    elif len(self.bytedict['Step number']) > 1: print("#WARNING : Doesn't seem to be a scan job, however GaussianLog read it as such!") #for very odd errors only

            else:
                singlepoint = True
                #print('#WARNING : Not checking singlepoint sanity yet!') #for singlepoint_job




###orphans

def read_mulliken_charges(filename):
    """Returns a list of the Mulliken charges that first appear in the file"""
    with open(filename,'r') as gaussian_file:
        for line in gaussian_file:
            if "Mulliken atomic charges:" in line:
                gaussian_file.readline()
                break
        charges = []
        for line in gaussian_file:
            words = line.split()
            if len(words) > 3:
                break
            charges.append(float(words[2]))
        
    return charges
