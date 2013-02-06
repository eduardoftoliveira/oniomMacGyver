#!/usr/bin/env python3

from prmtop import *

x = prmtop('model.prmtop')
flag = x._flags['BONDS_INC_HYDROGEN']
sel = x.vmdsel('resid 25 103')
print ('Chosen atoms:', len(sel))
print (x.vmdsel_resid)
print (x.vmdsel_resname)
print (x.vmdsel_name)
bonds_inc_h = x.get_flag_data_as_list('BONDS_INC_HYDROGEN')
amber_atom_type = x.get_flag_data_as_list('ATOM_NAME')

bonds = x._retrieve_parm_bond('resid 1 to 10')
print('N bonds:',len(bonds))
#for bond in bonds:
#    print(bond.print_gaussian_way())

# DESIRED FLAG
#flag = 'DIHEDRAL_FORCE_CONSTANT'
#
#print(x.flags[flag].byte)
#print(x.flags[flag].line)
#print(x.flags[flag].read_n_lines)
#print(x.flags[flag].data_per_line)
#print(x.flags[flag].chars_per_data)
#print(x.flags[flag].datatype)
#
#mydata = x.get_flag_data_as_list(x.flags[flag])
#print(mydata)
#print(x.get_flag_data_as_list(x.flags['POINTERS']))
#print(x.get_flag_data_as_list(x.flags['POINTERS'])[14])
