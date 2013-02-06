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
        self._flags = self._get_all_flags(file_limit_MB)
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

    def get_flag_data_as_list(self, flag_str): 

        # Seek appropriate flag object
        flagObj = self._flags[flag_str]

        f = open(self.name)
        f.seek(flagObj.byte)
        
        # Skip two lines (%FLAG and %FORMAT)
        for i in range(2):
            line = f.readline()

        data_list = []
        for i in range(flagObj.read_n_lines):                   #LOOP over lines
            line = f.readline()
            for j in range(int(len(line.strip('\n')) / flagObj.chars_per_data)): 
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
        for flag in self._flags:
            print (flag)
            all_data[flag] = self.get_flag_data_as_list(self._flags[flag]) 
        return all_data

    def vmdsel(self, selexpr):
        
        atom_name   = self.get_flag_data_as_list('ATOM_NAME')
        resname_raw  = self.get_flag_data_as_list('RESIDUE_LABEL')
        resi_idx    = self.get_flag_data_as_list('RESIDUE_POINTER')
        self.n_atoms = self.get_flag_data_as_list('POINTERS')[0]
        resid = self._pointers2list(resi_idx, self.n_atoms) # returns strings
        resname = [resname_raw[int(resid[i])-1] for i in range(self.n_atoms)]
        master_approved = [True for i in range(self.n_atoms)]
        
        vmdsel_list = selexpr.split('and')

        for expr in vmdsel_list:
            neg, sele_by, selection_items = self._parse_unit(expr)
            if sele_by == 'name':    atom_list = atom_name
            if sele_by == 'resid':   atom_list = resid
            if sele_by == 'resname': atom_list = resname
            approved = self._unitsel(neg, selection_items, atom_list)
            for i in range(self.n_atoms):
                if not approved[i]:
                    master_approved[i] = False

        # Create list of approved atom indexes
        # Create self lists of pdbInfo for selected atoms
        self.vmdsel_name = []
        self.vmdsel_resname = []
        self.vmdsel_resid = []
        approved_indexes = []
        for i in range(self.n_atoms):
            if master_approved[i]:
                approved_indexes.append(i)
                self.vmdsel_name   .append(atom_name[i])
                self.vmdsel_resname.append(resname  [i])
                self.vmdsel_resid  .append(resid    [i])
        return approved_indexes

    def _pointers2list(self, pointrs, N):
        out_list = [0 for i in range(N)]
        pointrs.append('fake pointer')
        pointr_idx = 0
        for i in range(N):
            # index starting at 1, as specified in pointrs
            if pointrs[pointr_idx] == i+1:
                pointr_idx += 1
            out_list[i] = str(pointr_idx) 
        return out_list

    def _parse_unit(self, unit):
        """called in vmdselection"""
    
        unit_fields = unit.split()
        u = 0
    
        # Negation?
        if unit_fields[0] == 'not':
            negative = True
            u += 1
        else:   negative = False
    
        # Selecting by what?
        sele_by = unit_fields[u]
        u += 1
    
        # List of what to select
        sele_items = unit_fields[u:] 
        
        # Selection range? (resid only)
        if (sele_by == 'resid') and 'to' in sele_items:
            n_TOs = sele_items.count('to')
            for i in range(n_TOs):
                idx = sele_items.index('to')
                start = int(sele_items[idx-1])
                stop =  int(sele_items[idx+1])
                sele_items.pop(idx)
                requested_range = []
                int_range = [ i for i in range(start+1,stop)]
                int_range.reverse()
                for i in int_range:
                    sele_items.insert(idx,str(i)) 
        #print 'Negation:  ' + str(negative)
        #print 'Select_by: ' + sele_by
        #print 'Items:     ' + str(sele_items)
        return negative, sele_by, sele_items
    
    def _unitsel(self, negation, selection_list, atom_list):
    
        n_atoms = len(atom_list)
        approvals = [False for i in range(n_atoms)]
        
        i = 0
        for atom in atom_list:
            if atom in selection_list:
                approvals[i] = True
            i += 1
    
        if negation:
            for i in range(n_atoms):
                if approvals[i]:
                    approvals[i] = False
                elif not approvals[i]:
                    approvals[i] = True
    
        return approvals

    def _retrieve_parm_bond(self, vmdsel_expr):

        sel_idx = self.vmdsel(vmdsel_expr)

        # We need a list of atoms
        # By default, use all :(
        # This shows the necessity of vmdsel module
        n_atoms = self.get_flag_data_as_list('POINTERS')[0]

        # Read parms
        force_list = self.get_flag_data_as_list('BOND_FORCE_CONSTANT')
        equil_list = self.get_flag_data_as_list('BOND_EQUIL_VALUE')
        bonds_inc_h = self.get_flag_data_as_list('BONDS_INC_HYDROGEN')
        bonds_not_h = self.get_flag_data_as_list('BONDS_WITHOUT_HYDROGEN')

        # Get atom types
        # Will be change to self.atoms_retyped[vmd_sel]
        amber_atom_type = self.get_flag_data_as_list('AMBER_ATOM_TYPE')

        # All bonds
        bonds = bonds_inc_h + bonds_not_h
        
        bonds_out = []

        n_bonds = int(len(bonds)/3)
        print ('Working with %d bonds.' % (n_bonds))
        for i in range(n_bonds):
            idx1 = int(bonds[i*3+0]/3) # atom 1 index
            idx2 = int(bonds[i*3+1]/3) # atom 2 index
            if idx1 in sel_idx and idx2 in sel_idx:

                bond_idx = bonds[i*3+2]-1  # 1 indexed
                amber_type1 = amber_atom_type[idx1]
                amber_type2 = amber_atom_type[idx2]
                force = force_list[bond_idx]
                equil = equil_list[bond_idx]
                #print(amber_type1, amber_type2, force, equil)
                this_bond = parm_bond(
                    amber_type1, amber_type2, equil, force)

                # Verify if bond exists and conflicts
                is_bond_new = True
                for existing_bond in bonds_out:
                    if this_bond.has_same_atoms(existing_bond):
                        is_bond_new = False
                        if not this_bond.has_same_values(existing_bond):
                            print ('WARNING: INCONSISTENT parameters:')
                            print (this_bond.print_gaussian_way())
                            print (existing_bond.print_gaussian_way())

                if is_bond_new:
                    bonds_out.append(this_bond)

        return bonds_out


    def gen_oniom(self, vmd_sel = ''):
        """Freaking awesome function"""
        return 0

class parm_bond():
    def __init__(self, atom1, atom2, equil, const):
        self.atom1 = atom1
        self.atom2 = atom2
        self.equil = float(equil)
        self.const = float(const)

    def has_same_atoms(self, other_parm_bond):
        cis = (self.atom1 == other_parm_bond.atom1 and
               self.atom2 == other_parm_bond.atom2)
        trans = (self.atom1 == other_parm_bond.atom2 and
                 self.atom2 == other_parm_bond.atom1)
        if cis or trans:
            return True
        else:
            return False

    def has_same_values(self, other_parm_bond):
        return (self.equil == other_parm_bond.equil and
                self.const == other_parm_bond.const)

    def print_gaussian_way(self):
        return('HrmBnd %2s %2s %6.2f %6.4f' 
              % (self.atom1, self.atom2, self.equil, self.const))


