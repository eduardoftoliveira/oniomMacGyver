#!/usr/bin/env python3

import os
from subprocess import getoutput

class FlagInfo():
    def __init__(self, ptr_byte, ptr_line, read_n_lines, textformat):
        self.byte = ptr_byte
        self.line = ptr_line            # Unused
        self.read_n_lines = read_n_lines
        (self.data_per_line, 
         self.chars_per_data,
         self.datatype) = self._interpret_format(textformat)

    def _interpret_format(self, frmt):
        """ Takes something like 10I8 and gives 10 + I + 8"""
    
        nondigits = []
        for char in frmt:
            if not char.isdigit():
                nondigits.append(char)
        datatype = nondigits[0] # First is data type, second (if exists) is a dot. Example: 5E16.8

        # Nlinedata is the number of data per line.
        Nlinedata = int(frmt.split(datatype)[0]) 
    
        if len(nondigits) == 1:
            datasize = int(frmt.split(datatype)[1])
        elif len(nondigits) == 2: 
            datasize = int(frmt.split(datatype)[1].split('.')[0])
        else:
            raise RuntimeError('Format string --- %s  ---does \
                               not look like these:\n \
                               20a4 or 5E16.8' % (frmt))
        
        return Nlinedata, datasize, datatype # Ndata * sizedata = 80


class prmtop():
    def __init__(self, name, file_limit_MB=150):
        self.name = name
        self.flags = self._get_all_flags(file_limit_MB)
        ###self.all_data_dict = self._read_all()


    def _get_all_flags(self, file_limit_MB):
        file_size_MB = float(os.stat(self.name).st_size) / (1024**2)
        if file_size_MB > file_limit_MB:
            raise RuntimeError(
                'File size is %f MB. Max = %f MB' % (
                    file_size_MB, file_limit_MB))

        flags_dict = {}

        ### Use UNIX grep to get line/byte indexes of %FLAGs 
        flag_list = getoutput('grep -nb "%%FLAG" %s' % (self.name)).split('\n')

        ### Get formats for each flag assuming same order :-)
        format_list = getoutput('grep -n "%%FORMAT" %s' % (self.name)).split('\n')
        format_list = [frmt.split('(')[1].split(')')[0] for frmt in format_list]

        # Generate lines list
        flag_lines = [ int(flag.split(':')[0]) for flag in flag_list]
        
        ### Artifitially append number of lines plus one to flag_lines
        ### will be usefull when knowing the number of data lines in the
        ### last flag.
        total_lines = int(getoutput('wc -l %s' % (self.name)).split()[0])
        flag_lines.append(total_lines + 1)

        i = 0
        for flag in flag_list:
            name = flag.split(' ')[1]
            pointer_byte = int(flag.split(':')[1])
            pointer_line = flag_lines[i]
            textformat = format_list[i]

            # data between flags excluding %FLAG and %FORMAT
            read_n_lines = -2 + flag_lines[i+1] - flag_lines[i]     
            i += 1

            flags_dict[name] = FlagInfo(
                pointer_byte, pointer_line, read_n_lines, textformat)

        return flags_dict

    def get_flag_data_as_list(self, flagObj): 

        f = open(self.name)
        f.seek(flagObj.byte)
        
        # Skip two lines (%FLAG and %FORMAT)
        for i in range(2):
            line = f.readline()

        data_list = []
        for i in range(flagObj.read_n_lines):                   #LOOP over lines
            line = f.readline()
            for j in range(int(len(line.strip()) / flagObj.chars_per_data)): 
                data_as_str = line[j*flagObj.chars_per_data : 
                                   (j+1)*flagObj.chars_per_data]
                data_list.append(data_as_str)

        # Recognized data types:
        # I - int | E - float | a - string
        data = []
        if flagObj.datatype == 'I':
            data = [int(rawdata) for rawdata in data_list]
        elif flagObj.datatype == 'E':
            data = [float(rawdata) for rawdata in data_list]
        elif flagObj.datatype == 'a': 
            data = [rawdata.replace(' ','') for rawdata in data_list] 

        f.close()
        return data

    def _read_all(self):
        all_data = {}
        for flag in self.flags:
            print (flag)
            all_data[flag] = self.get_flag_data_as_list(self.flags[flag]) 
        return all_data

    def retrieve_parm_bond(self):

        # We need a list of atoms
        # By default, use all :(
        # This shows the necessity of vmdsel module
        # n_atoms = self.get_flag_data_as_list(
        #    self.flags['POINTERS'])[0]

        # Create parms
        BOND_FORCE_CONSTANT = self.get_flag_data_as_list(
            self.flags['BOND_FORCE_CONSTANT'])
        BOND_EQUIL_VALUE    = self.get_flag_data_as_list(
            self.flags['BOND_EQUIL_VALUE'])
        BONDS_INC_HYDROGEN = self.get_flag_data_as_list(
            self.flags['BONDS_INC_HYDROGEN'])
        BONDS_WITHOUT_HYDROGEN ) self.get_flag_data_as_list(
            self.flags['BONDS_WITHOUT_HYDROGEN'])

        AMBER_ATOM_TYPE = self.get_flag_data_as_list(
            self.flags['AMBER_ATOM_TYPE'])

        # PARSE ALL Bonds
        n_bonds = int(len(BONDS_WITHOUT_HYDROGEN)/3)
        for i in range(n_bonds):
            idx1 = BONDS_WITHOUT_HYDROGEN[i*3+0]
            idx2 = BONDS_WITHOUT_HYDROGEN[i*3+1]
            bond_idx  = BOND_EQUIL_VALUE[i*3+2]
            amber_type1 = AMBER_ATOM_TYPE[int(idx1/3)]
            amber_type2 = AMBER_ATOM_TYPE[int(idx2/3)]

        
        

    def gen_oniom(self):
        return 0

class parm_bond():
    def __init_(self, atom1, atom2, equil, const):
        self.atom1 = atom1
        self.atom2 = atom2
        self.equil = float(equil)
        self.const = float(const)

    def defines_same_atoms(other_parm_bond):
        cis = (self.atom1 == other_parm_bond.atom1 and
               self.atom2 == other_parm_bond.atom2)
        trans = (self.atom1 == other_parm_bond.atom2 and
                 self.atom2 == other_parm_bond.atom1)
        if cis or trans:
            return True
        else:
            return False

    def defines_same_values(other_parm_bond):
        return (self.equil == other_parm_bond.equil and
                self.const == other_parm_bond.const)

    def print_gaussian_way(self):
        return('HrmBnd %2s %2s %6.2f %6.4f' 
              % (self.atom1, self.atom2, self.equil, self.const))


