import os
import math
import subprocess
from omg import atoms
from omg import iolines

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
# First is data type, second (if exists) is a dot. Example: 5E16.8
        datatype = nondigits[0] 

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


class Prmtop():
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
        grep_output = subprocess.Popen('grep -nb "%%FLAG" %s' % (self.name),
                                        shell=True,
                                        stdout=subprocess.PIPE)
        flag_list = grep_output.communicate()[0].split('\n')[:-1]

        #flag_list = getoutput('grep -nb "%%FLAG" %s' % (self.name)).split('\n')

        ### Get formats for each flag assuming same order :-)
        grep_output = subprocess.Popen('grep -n "%%FORMAT" %s' % (self.name),
                                        shell=True,
                                        stdout=subprocess.PIPE)
        format_list = grep_output.communicate()[0].split()
        format_list = [frmt.split('(')[1].split(')')[0] for frmt in format_list]

        # Generate lines list
        flag_lines = [ int(flag.split(':')[0]) for flag in flag_list]
        
        ### Artifitially append number of lines plus one to flag_lines
        ### will be usefull when knowing the number of data lines in the
        ### last flag.
        grep_output=subprocess.Popen('wc -l %s' % (self.name), shell=True,
                                     stdout=subprocess.PIPE)
        total_lines = int(grep_output.communicate()[0].split()[0])
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

    def read_flag(self, flag_str): 

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
            all_data[flag] = self.read_flag(self._flags[flag]) 
        return all_data

    def vmdsel(self, selexpr):

        atom_name   = self.read_flag('ATOM_NAME')
        self.n_atoms = self.read_flag('POINTERS')[0]
        resname_raw  = self.read_flag('RESIDUE_LABEL')
        resi_idx    = self.read_flag('RESIDUE_POINTER')
        resid = self._pointers2list(resi_idx, self.n_atoms) # returns strings
        resname = [resname_raw[int(resid[i])-1] for i in range(self.n_atoms)]
        master_approved = [True for i in range(self.n_atoms)]

        # Make some self available
        self.pdb_atom_name = atom_name
        self.pdb_resname = resname
        self.pdb_resid = resid
        
        # empty selection == all atoms
        if selexpr == '':
            return [ i for i in range(self.n_atoms)]

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


    def _is_new_dihedral(self, dihedrals_list, new_dihe):
        isnew = True
        # Check if dihedral with same atoms already exists
        for existing_dihe in dihedrals_list:
            if new_dihe.has_same_atoms(existing_dihe):
                isnew = False
                # Check if same atoms lead to same values
                if not new_dihe.has_same_values(existing_dihe):
                    print ('WARNING: INCONSISTENT parameters:')
                    print (new_dihe.print_gaussian_way())
                    print (existing_dihe.print_gaussian_way())

        return isnew

    def _retrieve_parm_dihedral(self):
        force_list = self.read_flag('DIHEDRAL_FORCE_CONSTANT')
        perio_list = self.read_flag('DIHEDRAL_PERIODICITY')
        phase_list = self.read_flag('DIHEDRAL_PHASE')

        inc_h = self.read_flag('DIHEDRALS_INC_HYDROGEN')
        not_h = self.read_flag('DIHEDRALS_WITHOUT_HYDROGEN')
        diheds =  inc_h + not_h
        n_dihed = int(len(diheds)/5)
        print ('Decrypting %d dihedrals/impropers...' % (n_dihed))

        dihe_out = []
        impropers_out = []

        buffed = False
        last_idxs = ( 0,0,0,0)
        for i in range(n_dihed-1,-1,-1): # going backwards

            # Set up atoms
            idx1 = diheds[i*5+0]/3 
            idx2 = diheds[i*5+1]/3
            idx3 = diheds[i*5+2]/3
            idx4 = diheds[i*5+3]/3
            mm1 = self.upper_atom_types[int(idx1)]
            mm2 = self.upper_atom_types[int(idx2)]
            mm3 = self.upper_atom_types[int(abs(idx3))]
            mm4 = self.upper_atom_types[int(abs(idx4))]
            current_idxs = (idx1, idx2, abs(idx3), abs(idx4))

            # Read values for this dihedral term
            idx = diheds[i*5+4]-1 # -1 for zero indexing
            pk = force_list[idx]
            pn = perio_list[idx]
            phase = phase_list[idx]

            # First, check if is dihedral or improper
            # If dihedral, check if buffed.
            # Not buffed: append it or buff it.
            # Buffed: add + append, or add!

            if idx4 > 0: # is dihedral, not improper
                
                if not buffed: 
                    # no dihedral term waiting for another term

                    # First create the dihedral term.
                    this_dihe = parm_dihedral(mm1,mm2,mm3,mm4, pk,phase,pn)

                    if idx3 > 0: 
                        # single term. Just append.
                        if self._is_new_dihedral(dihe_out, this_dihe):
                            dihe_out.append(this_dihe)

                    elif idx3 < 0: 
                        # multi term (if next entry has same atoms) 
                        buffed = True

                    else: 
                        # first atom in third position? Raise Error!
                        raise RuntimeError ('is -0 negative?')

                # Now the tricky part. If these atoms are not the same
                # atoms as in the dihedral term waiting, then it was not
                # supposed to buffed and should have been appended already

                elif buffed:             # dihedral term waiting

                    if current_idxs != last_idxs:
                        # Append the buffed part.
                        if self._is_new_dihedral(dihe_out, this_dihe):
                            dihe_out.append(this_dihe)
                        # Create new dihedral term
                        this_dihe = parm_dihedral(mm1,mm2,mm3,mm4, pk,phase,pn)

                        # Now append if not buffed
                        if 0 < idx3:
                            if self._is_new_dihedral(dihe_out, this_dihe):
                                dihe_out.append(this_dihe)

                    elif current_idxs == last_idxs:

                        # Add a term
                        this_dihe.add_term(mm1,mm2,mm3,mm4, pk,phase,pn)

                        if 0 < idx3: 
                            # Finalize the dihedral by appending it
                            if self._is_new_dihedral(dihe_out, this_dihe):
                                dihe_out.append(this_dihe)

                    buffed = idx3 < 0

            else: # is Improper

                this_improper = parm_improper(
                    mm1, mm2, mm3, mm4,
                    pk, phase, pn)

                # Check consistency
                is_improper_new = True
                for existing_imp in impropers_out:
                    if this_improper.has_same_atoms(existing_imp):
                        is_improper_new = False
                        if not this_improper.has_same_values(existing_imp):
                            print ('WARNING: INCONSISTENT parameters:')
                            print (this_improper.print_gaussian_way())
                            print (existing_imp.print_gaussian_way())
                            # dont break cycle to check all impropers

                # Append if new
                if is_improper_new:
                    impropers_out.append(this_improper)

            last_idxs = current_idxs

        return dihe_out, impropers_out

    def _retrieve_parm_angle(self):

        n_atoms = self.read_flag('POINTERS')[0]

        # Read parms
        force_list = self.read_flag('ANGLE_FORCE_CONSTANT')
        equil_list = self.read_flag('ANGLE_EQUIL_VALUE')
        angles_inc_h = self.read_flag('ANGLES_INC_HYDROGEN')
        angles_not_h = self.read_flag('ANGLES_WITHOUT_HYDROGEN')

        #amber_atom_type = self.read_flag('AMBER_ATOM_TYPE')

        # All angles
        angles = angles_inc_h + angles_not_h
        
        angles_out = []

        n_angles = int(len(angles)/4)
        print ('Decrypting %d angles...' % (n_angles))
        for i in range(n_angles):
            idx1 = int(angles[i*4+0]/3) # atom 1 index
            idx2 = int(angles[i*4+1]/3) # atom 2 index
            idx3 = int(angles[i*4+2]/3)
            if (idx1 in self.atom_sel_idx and 
                idx2 in self.atom_sel_idx and
                idx3 in self.atom_sel_idx):

                angle_idx = angles[i*4+3]-1  # 1 indexed
                amber_type1 = self.upper_atom_types[idx1]
                amber_type2 = self.upper_atom_types[idx2]
                amber_type3 = self.upper_atom_types[idx3]
                force = force_list[angle_idx]
                equil = equil_list[angle_idx]
                this_angle = parm_angle(
                    amber_type1, amber_type2, amber_type3, equil, force)

                # Verify if angle exists and conflicts
                is_angle_new = True
                for existing_angle in angles_out:
                    if this_angle.has_same_atoms(existing_angle):
                        is_angle_new = False
                        if not this_angle.has_same_values(existing_angle):
                            print ('WARNING: INCONSISTENT parameters:')
                            print (this_angle.print_gaussian_way())
                            print (existing_angle.print_gaussian_way())
                            # dont break cycle to check all angles

                if is_angle_new:
                    angles_out.append(this_angle)

        return angles_out

    def _gen_zmat(self, inpcrd_name):

        text = ''

        chargelist = self.read_flag('CHARGE')
        if 'ATOMIC_NUMBER' in self._flags: # old amboniom_elements.py (glycam)
            elements = self._guess_elements()
        else:
            elements = self._read_elements()
            
        total_charge = 0

        X,Y,Z = self._coords_from_inpcrd(inpcrd_name)

        j = 0
        for i in self.atom_sel_idx:
            name = self.pdb_atom_name[i].replace('-','').replace('+','')
            residue_name = self.pdb_resname[i].replace('-','').replace('+','')
            residue_number = self.pdb_resid[i]
            mm_type = self.upper_atom_types[i]
            charge = chargelist[i] / 18.2223
            total_charge += charge
            mask = '0'
            x = X[i]
            y = Y[i]
            z = Z[i]
            chain = ''
            layer = 'L'
            element = elements[j]
            j += 1
            link_element = link_mm_type = link_bound_to = link_scale1 = None

            # create atom
            this_atom = atoms.Atom(element, (x, y, z))
            resinfo = atoms.RESinfo(name, residue_name, residue_number, chain)
            this_atom.set_resinfo(resinfo)
            oniominfo = atoms.Oniom(mask, layer)
            this_atom.set_oniom(oniominfo)
            mm = atoms.MM(mm_type, charge)
            this_atom.set_mm(mm)

            # print z-matrix for atom
            text += iolines.atom2zmat(this_atom)
            
        # Add stuff to text
        header = ''
        #header += '%nproc=4\n'
        #header += '%mem=2GB\n'
        #header += '%chk=chk.chk\n'
        header += '# amber=softonly geom=connectivity\n\n' 
        header += 'Se amanha nao chover vai estar um lindo dia de sol\n\n'
        header +=  'Sum of partial charges: %f\n' % (total_charge) 
        return header + text


    def _gen_connectivity(self):

        print ('Decrypting connectivity from bonds...')
        bonds_inc_h = self.read_flag('BONDS_INC_HYDROGEN')
        bonds_not_h = self.read_flag('BONDS_WITHOUT_HYDROGEN')
        bonds = bonds_inc_h + bonds_not_h
        n_bonds = int(len(bonds)/3)
        conn = [[] for i in range(len(self.atom_sel_idx))]
        for i in range(n_bonds):
            idx1 = int(bonds[i*3+0]/3) # atom 1 index
            idx2 = int(bonds[i*3+1]/3) # atom 2 index
            if idx1 in self.atom_sel_idx and idx2 in self.atom_sel_idx:
                sorted_idx = [self.atom_sel_idx.index(idx1),
                              self.atom_sel_idx.index(idx2)]
                sorted_idx.sort()
                conn[sorted_idx[0]].append(sorted_idx[1]) 

        # Sort within each atom
        for atom in conn:
            atom.sort()

        # Print with style
        text = ''
        for i in range(len(conn)):
            text += '%6d' % (i+1)       # Atom number
            already_there = []
            for j in conn[i]:
                if j not in already_there:
                    text += '%6d 1.0' % (j+1)
                    already_there.append(j)
            text += '\n'

        return text

    def _retrieve_parm_bond(self):

        n_atoms = self.read_flag('POINTERS')[0]

        # Read parms
        force_list = self.read_flag('BOND_FORCE_CONSTANT')
        equil_list = self.read_flag('BOND_EQUIL_VALUE')
        bonds_inc_h = self.read_flag('BONDS_INC_HYDROGEN')
        bonds_not_h = self.read_flag('BONDS_WITHOUT_HYDROGEN')

        # Get atom types
        # Will be change to self.atoms_retyped[vmd_sel]
        amber_atom_type = self.read_flag('AMBER_ATOM_TYPE')

        # All bonds
        bonds = bonds_inc_h + bonds_not_h
        
        bonds_out = []

        n_bonds = int(len(bonds)/3)
        print ('Decrypting %d bonds...' % (n_bonds))
        for i in range(n_bonds):
            idx1 = int(bonds[i*3+0]/3) # atom 1 index
            idx2 = int(bonds[i*3+1]/3) # atom 2 index
            if idx1 in self.atom_sel_idx and idx2 in self.atom_sel_idx:

                bond_idx = bonds[i*3+2]-1  # 1 indexed
                amber_type1 = self.upper_atom_types[idx1]
                amber_type2 = self.upper_atom_types[idx2]
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

    def _gen_gaff_uppercase(self):
        amber_type_list = self.read_flag('AMBER_ATOM_TYPE')
        amber = []
        gaff = []
        # Make list of uppercases (AMBER) and lowercases (GAFF)
        for atomtype in amber_type_list:
            if atomtype == atomtype.upper():
                if atomtype not in amber:
                    amber.append(atomtype)
            elif atomtype == atomtype.lower():
                if atomtype not in gaff:
                    gaff.append(atomtype) 
            else:
                print ('WHAT atomtype IS THIS??? ---> %s' % (atomtype))
                raise RuntimeError ('Mixed lower/uppercase atom type')

        # Retypers and substituters for second letter
        retype = {}
        alternative_list = []
        substitutes = 'JKXYZ89IV567FGHQRSTULW' # should be enough
        for atomtype in gaff: # atomtype is .upper() now
            if atomtype.upper() in amber: # need to retype
                found_alternative = False
                for s in substitutes:
                    alternative = atomtype[0].upper() + s
                    if (alternative not in amber and
                        alternative not in gaff and
                        alternative not in alternative_list):
                        found_alternative = True
                        retype[atomtype] = alternative
                        alternative_list.append(alternative)
                        break
                if not found_alternative:
                    raise RuntimeError ('Could not retype %s' %(atomtype))
        if len(retype) > 0:
            print ('** lowercase amber atom types (GAFF) have been retyped:')
            print ('---------------')
            print ('original -> new')
            print ('---------------')
            for r in retype:
                print ('   %2s       %2s' % (r, retype[r]))
            print ('---------------')
            print ('\nNOTE:')
            print (' retyping link-atoms solves most missing parameters ;)\n')
        
        new_amber_type = []
        for atomtype in amber_type_list:
            if atomtype in retype:
                new_amber_type.append(retype[atomtype])
            else: new_amber_type.append(atomtype.upper())

        return new_amber_type

    def _retrieve_vdw(self):
        # needs self.upper_atom_types and self.atom_sel_idx set up already
        type_index = self.read_flag('ATOM_TYPE_INDEX')
        n_atoms = self.read_flag('POINTERS')[0]
        N_types = 0 # nr of different atoms in prmtop (sel and non sel)
        IAC = {}

        for i in range(n_atoms):
            upper = self.upper_atom_types[i]
            N_types = max(N_types, type_index[i])
            if (upper not in IAC) and (i in self.atom_sel_idx):
                IAC[upper] = type_index[i]

        # indexes to search in lennard jones coefs
        # of pairs of same atoms
        idx_list = self.read_flag('NONBONDED_PARM_INDEX')
        ICOs = [] 
        amber_types = []
        for upper in IAC:
            # -1 for 0 indexing
            ICOs.append(idx_list[N_types*(IAC[upper]-1)+IAC[upper]-1]-1)
            amber_types.append(upper) # ensures same order in following loops

        # Get A and B coefs of Lennard Jones
        acoef = self.read_flag('LENNARD_JONES_ACOEF')
        bcoef = self.read_flag('LENNARD_JONES_BCOEF')

        vdwlist = []

        for i in range(len(ICOs)):
            ico = ICOs[i]
            #print ('Atom: ', amber_types[i])
            a = acoef[ico]
            b = bcoef[ico]
            #print('coefs:',a,b)

            # calc r 
            if b > 0:
                r_6 = (2*a/b)
                r = pow(r_6, 1.0/6)
                ea = b/(r_6*2)
                eb = a/(r_6**2)
                if round(ea,4) != round(eb,4):
                    raise RuntimeError (
                        'well depth different from coef A and B')

                R = r/2     # r = ri + rj
                E = ea       # E = sqrt(ei*ej)
                vdwlist.append(parm_vdw(amber_types[i],R,E))

            else:
                #print ('WARNING: VDW is 0.0 for', amber_types[i])
                #print ('LENNARD_JONES_BCOEF was zero for pair %s-%s'
                #       % (amber_types[i], amber_types[i]))
                # ASSIGN HERE
                vdwlist.append(parm_vdw(amber_types[i],0.0,0.0))
        return vdwlist
                       

    def _read_elements(self):

        atom_names = self.read_flag('ATOM_NAME')
        n_atoms    = self.read_flag('POINTERS')[0]

        special = {}
        special['IP'] = 'Na'
        special['IM'] = 'Cl'
        special['Na'] = 'Na'
        special['K']  = 'K'
        special['C0'] = 'Ca'
        special['Cl'] = 'Cl'
        special['Cs'] = 'Cs'
        special['MG'] = 'Mg'
        special['Rb'] = 'Rb'
        special['Zn'] = 'Zn'
        special['F']  = 'F'
        special['Br'] = 'Br'
        special['I']  = 'I'

        known = ['H','C','N','O','P','S']

        elements = []
        for i in range(n_atoms):
            if i in self.atom_sel_idx:
                element = atom_names[i]
                if element in special:
                    elements.append(special[element])
                elif element[0] in known:
                    elements.append(element[0])
                else:
                    elements.append('?')
                    print ('Cannot guess element from atom_name %s' % (
                        atom_names[i][0]))
                    print ('Your %d atom will be : ? ' % (len(elements)))
        return elements

    def _guess_elements(self):

        atomic_numbers = self.read_flag('ATOMIC_NUMBER')

        periodic_table = {}
        periodic_table[0]  =  'X'
        periodic_table[1]  =  'H'
        periodic_table[6]  =  'C'
        periodic_table[7]  =  'N'
        periodic_table[8]  =  'O'
        periodic_table[9]  =  'F'
        periodic_table[11] = 'Na'
        periodic_table[12] = 'Mg'
        periodic_table[15] =  'P'
        periodic_table[16] =  'S'
        periodic_table[17] = 'Cl'
        periodic_table[19] =  'K'
        periodic_table[20] = 'Ca'
        periodic_table[25] = 'Mn'
        periodic_table[-1] = 'Zn'
        periodic_table[26] = 'Fe'
        periodic_table[27] = 'Co'
        periodic_table[28] = 'Ni'
        periodic_table[29] = 'Cu'
        periodic_table[30] = 'Zn'
        periodic_table[35] = 'Br'
        periodic_table[37] = 'Rb'
        periodic_table[53] =  'I'
        periodic_table[55] = 'Cs'

        elements = [periodic_table[nr] for nr in atomic_numbers]
        #for nr in atomic_numbers:
        #    elements.append(periodic_table[nr])
        #print ('Sorry, atomic nr %d is not in the periodic table yet' % (nr))
        return elements

    def _coords_from_inpcrd(self, inpcrd_name):
        x = []
        y = []
        z = []
        f = open(inpcrd_name)
        f.readline() # title line
        n_atoms = int(f.readline().split()[0])
        print ('Number of atoms:', n_atoms)
        read_n_lines = int(math.ceil(float(n_atoms)/2))
        for i in range(read_n_lines):
            line = f.readline()
            n_chunks = int(len(line)/36) # 3 coords * 12 digits
            for j in range (n_chunks):
                chunk = line[j*36:(j+1)*36]
                x.append(float(chunk[ 0:12]))
                y.append(float(chunk[12:24]))
                z.append(float(chunk[24:36]))
        f.close()
        return x,y,z


    def gen_oniom(self, filename, inpcrd, notip3p, vmd_sel = ''): # default to all!
        """This is Awesome"""

        # Open outfile (Force Overwrite)
        out = open(filename, 'w')

        # Make an atom selection
        self.atom_sel_idx = self.vmdsel(vmd_sel)

        # Retype lowercase atom types (GAFF)
        self.upper_atom_types = self._gen_gaff_uppercase()

        # Create QmmmAtomPdb list
        # Read coordinates from .inpcrd ?
        atoms_text = self._gen_zmat(inpcrd) 
        out.write(atoms_text)
        out.write('\n')

        # Connectivity
        conn_text = self._gen_connectivity()
        out.write(conn_text)
        out.write('\n\n')

        # Call vdw, bonds, angles, dihedrals and impropers
        bonds = self._retrieve_parm_bond()
        angles = self._retrieve_parm_angle()
        dihedrals, impropers = self._retrieve_parm_dihedral()
        vdws = self._retrieve_vdw()

        # HrmBnd1 HW HW OW 0.00 0.00
        # HrmBnd1 HW OW HW 0.00 0.00

        # Amber non-bonded function
        out.write('NonBon 3 1 0 0 0.0 0.0 0.5 0.0 0.0 -1.2\n')

        for vdw in vdws:
            out.write(vdw.print_gaussian_way() + '\n')
        for bond in bonds:
            out.write(bond.print_gaussian_way() + '\n')
        for ang in angles:
            out.write(ang.print_gaussian_way() + '\n')

        # tip3p
        if not notip3p:
            out.write('HrmBnd1 HW HW OW 0.00 0.00\n')
            out.write('HrmBnd1 HW OW HW 0.00 0.00\n')

        for dih in dihedrals:
            out.write(dih.print_gaussian_way() + '\n')
        for imp in impropers:
            out.write(imp.print_gaussian_way() + '\n')

        out.write('\n\n\n')

        out.close()

class parm_vdw():
    def __init__(self, atom, r, e):
        self.atom = atom
        self.e = e
        self.r = r

    def print_gaussian_way(self):
        return ('VDW %2s %8.4f %8.4f' % (
            self.atom, self.r, self.e))


class parm_bond():
    def __init__(self, atom1, atom2, equil, force):
        self.atom1 = atom1
        self.atom2 = atom2
        self.equil = float(equil)
        self.force = float(force)

    def has_same_atoms(self, other):
        cis = (self.atom1 == other.atom1 and
               self.atom2 == other.atom2)
        trans = (self.atom1 == other.atom2 and
                 self.atom2 == other.atom1)
        return cis or trans

    def has_same_values(self, other):
        return (self.equil == other.equil and
                self.force == other.force)

    def print_gaussian_way(self):
        return('HrmStr1 %2s %2s %6.2f %6.4f' 
              % (self.atom1, self.atom2, self.force, self.equil))

class parm_angle():
    def __init__(self, atom1, atom2, atom3, equil, force):
        self.atom1 = atom1
        self.atom2 = atom2
        self.atom3 = atom3
        self.equil = float(equil*180/math.pi)
        self.force = float(force)

    def has_same_atoms(self, other):
        cis = (self.atom1 == other.atom1 and
               self.atom3 == other.atom3)
        trans = (self.atom1 == other.atom3 and
                 self.atom3 == other.atom1)
        return (cis or trans) and (
        self.atom2 == other.atom2)

    def has_same_values(self, other):
        return (self.equil == other.equil and
                self.force == other.force)

    def print_gaussian_way(self):
        return('HrmBnd1 %2s %2s %2s %6.2f %6.4f' 
              % (self.atom1, self.atom2, self.atom3, self.force, self.equil))

class parm_dihedral():
    def __init__(self, atom1, atom2, atom3, atom4, 
                 force, phase, period,    
                 idivf = 1):  # >1 if general dihedral (*-CT-CT-*)

        # Set atoms 
        self.atom1 = atom1; 
        self.atom2 = atom2;
        self.atom3 = atom3;
        self.atom4 = atom4;
        self.idivf = idivf # known as NPaths in Gaussian

        # Set all periods to zeroed dihedral term
        self.periods = [( 0, 0.0) for i in range(4)]

        # Sel input period to respective force and phase
        self.periods[int(period)-1] = (phase, force)
        
    def has_same_atoms(self, other):
        cis = (self.atom1 == other.atom1 and
               self.atom4 == other.atom4)
        trans = (self.atom1 == other.atom4 and
                 self.atom4 == other.atom1)
        midcis = (self.atom2 == other.atom2 and
               self.atom3 == other.atom3)
        midtrans = (self.atom2 == other.atom3 and
                 self.atom3 == other.atom2)
        return ((cis and midcis) or (trans and midtrans))

    def has_same_values(self, other):
        return (self.periods == other.periods)

    def add_term(self, atom1, atom2, atom3, atom4,
                 force, phase, period):

        # Verify we are acting on the same atoms
        if (self.atom1 == atom1 and
            self.atom2 == atom2 and
            self.atom3 == atom3 and
            self.atom4 == atom4) == False:
            #raise RuntimeError (
            print ('Trying to add term to dihedral of different atoms') 
            print ('has >',self.atom1,self.atom2,self.atom3,self.atom4)
            print ('try >', atom1, atom2, atom3, atom4)
        else:
            self.periods[int(period)-1] = (phase, force)


    def print_gaussian_way(self):

        # Phases
        P1 = self.periods[0][0]*180/math.pi
        P2 = self.periods[1][0]*180/math.pi
        P3 = self.periods[2][0]*180/math.pi
        P4 = self.periods[3][0]*180/math.pi

        # Magnitudes
        M1 = self.periods[0][1]
        M2 = self.periods[1][1]
        M3 = self.periods[2][1]
        M4 = self.periods[3][1]

        return (
            'AmbTrs %2s %2s %2s %2s ' % (
                self.atom1, self.atom2, self.atom3, self.atom4) +
            #'%6.2f%6.2f%6.2f%6.2f' %(P1,P2,P3,P4) +
            '%3d %3d %3d %3d ' %(P1,P2,P3,P4) +
            '%7.3f%7.3f%7.3f%7.3f' % (M1,M2,M3,M4) +
            '%4.1f'%(self.idivf))

class parm_improper():
    def __init__(self, atom1, atom2, atom3, atom4, 
                 force, phase, period):

        # Set atoms 
        self.atom1 = atom1; 
        self.atom2 = atom2;
        self.atom3 = atom3;
        self.atom4 = atom4;

        # Set values
        self.force = force
        self.phase = float(phase*180/math.pi)
        self.period = period
        
    def has_same_atoms(self, other):
        # Forward
        sp1 = (self.atom1, self.atom2)
        sp2 = (self.atom3, self.atom4)
        op1 = (other.atom1, other.atom2)
        op2 = (other.atom3, other.atom4)
        # Reverse
        or1 = (other.atom2, other.atom1)
        or2 = (other.atom4, other.atom3)
        # Match
        cis = (sp1==op1 or sp1==or1) and (sp2==op2 or sp2==or2)
        trans=(sp1==op2 or sp1==or2) and (sp2==op1 or sp2==or1)
        return (cis or trans)


        return ((cis and midcis) or (trans and midtrans))

    def has_same_values(self, other):
        return (self.period == other.period and
                self.force  == other.force and
                self.phase  == other.phase)

    def print_gaussian_way(self):
        return (
            'ImpTrs %2s %2s %2s %2s' % (
                self.atom1, self.atom2, self.atom3, self.atom4) +
            '%6.1f%7.1f%4.1f' % (
                self.force, self.phase, self.period))

