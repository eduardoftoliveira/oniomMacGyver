#!/usr/bin/env python3

from prmtop import *

x = prmtop('model.prmtop')

# DESIRED FLAG
flag = 'DIHEDRAL_FORCE_CONSTANT'

print(x.flags[flag].byte)
print(x.flags[flag].line)
print(x.flags[flag].read_n_lines)
print(x.flags[flag].data_per_line)
print(x.flags[flag].chars_per_data)
print(x.flags[flag].datatype)

mydata = x.get_flag_data_as_list(x.flags[flag])
print(mydata)
print(x.get_flag_data_as_list(x.flags['POINTERS']))
