#!/usr/bin/env python

class Flag():
    """handle each prmtop section"""
    def __init__(self, list_of_lines):
        #
        self.name = None
        self.frmt = None
        self.raw_lines = []
        self.data = None
        self.text = ''.join(list_of_lines)
        # 
        self.parse(list_of_lines)
    
    def parse(self, list_of_lines):
        """ beware of %COMMENT ... """ # TODO
        self.name = list_of_lines[0][6:].strip()
        self.frmt = Format(list_of_lines[1].split('(')[1].split(')')[0])
        self.raw_lines = list_of_lines[2:]

    def get_data(self):
        """convert self.data_lines to real data"""

        # get each entry as strings
        data_as_strs = []
        for line in self.raw_lines:
            # for each entry in line:
            for j in range(int(len(line.strip('\n')) / self.frmt.c)): 
                data_as_strs.append(line[ j*self.frmt.c : (j+1)*self.frmt.c ])

        # convert to appropriate format
        self.data = [self.frmt.convert(string) for string in data_as_strs]

    def update_text(self):
        if not self.data:
            raise RuntimeError('must run get_data() first')

        line1 = '%' + 'FLAG %s' % self.name
        line1 += ' '*(80-len(line1))
        line2 = '%' + 'FORMAT(%s)' % self.frmt.strin
        line2 += ' '*(80-len(line2))
        text = line1 + '\n' + line2 + '\n'
   
        # write complete lines 
        n_lines = len(self.data) / self.frmt.n
        for i in range(n_lines):
            for j in range(self.frmt.n):
                text += self.frmt.back2str % self.data[i*self.frmt.n + j]
            text += '\n'

        # write last line if needed ( < self.frmt.n entries)
        last_line_size = len(self.data) % self.frmt.n # can be 0
        for j in range(last_line_size):
            text += self.frmt.back2str % self.data[(i+1)*self.frmt.n + j]
        text += '\n'

        self.text = text
                
class Format():
    def __init__(self, frmt_string):
        """ n = num entries, c = num chars, t = type, p = precision"""
        self.n, self.c, self.t, self.p = self.parse(frmt_string)
        # convert function
        self.convert = self.assign_convert_func()
        self.back2str = self.assign_back2str()
        self.strin = frmt_string
        
    def parse(self, frmt_string):
        """ Takes something like 10I8 and gives 10 + I + 8"""
        precision = None 
        nondigits = []
        for char in frmt_string:
            if not char.isdigit():
                nondigits.append(char)
    # First is data type, second (if exists) is a dot. Example: 5E16.8
        datatype = nondigits[0] 

        # Nlinedata is the number of data per line.
        Nlinedata = int(frmt_string.split(datatype)[0]) 
    
        if len(nondigits) == 1:
            datasize = int(frmt_string.split(datatype)[1])
        elif len(nondigits) == 2: 
            datasize = int(frmt_string.split(datatype)[1].split('.')[0])
            precision = int(frmt_string.split(datatype)[1].split('.')[1])
        else:
            raise RuntimeError('Format string --- %s  ---does \
                               not look like these:\n \
                               20a4 or 5E16.8' % (frmt_string))
        
        return Nlinedata, datasize, datatype, precision # Ndata * sizedata = 80

    def assign_back2str(self):
        if self.t == 'a':
            return '%%%ds' % self.c # '%4s' if c=4
        elif self.t == 'I':
            return '%%%dd' % self.c
        elif self.t == 'E':
            return '%%%d.%dE' % (self.c, self.p) # '%16.8e', c=16, p=8

    def assign_convert_func(self):
        if self.t == 'I':
            return int
        if self.t == 'E':
            return float
        if self.t == 'a':
            return self.striper

    def striper(self, string):
        return string.strip()


class Prmtop():
    def __init__(self, filename): 
        self.order = []
        tmp = {}
        self.sections = {}
        with open(filename) as f:
            self.version = f.readline()
            for line in f:
                if line[0:5] == '%FLAG':
                    name = line[6:].strip()
                    self.order.append(name)
                    tmp[name] = []
                tmp[name].append(line)

        # conver to Flag objects
        for key in self.order:
            self.sections[key] = Flag(tmp[key])

    def write(self):
        text = self.version
        for key in self.order:
            text += self.sections[key].text
        return text

    def add_bond(self, atom_i, atom_j, force, equil):
        """atom_i,j are 1-indexd"""

        i, j = (atom_i-1)*3, (atom_j-1)*3
    
        # increase pointers
        self.sections['POINTERS'].get_data()
        self.sections['POINTERS'].data[3] += 1  # MBONA
        self.sections['POINTERS'].data[12] += 1 # NBONA
        self.sections['POINTERS'].data[15] += 1 # NUMBND
        self.sections['POINTERS'].update_text()
    
        # add equil value
        self.sections['BOND_EQUIL_VALUE'].get_data()    # text -> data
        self.sections['BOND_EQUIL_VALUE'].data.append(equil) # add data
        self.sections['BOND_EQUIL_VALUE'].update_text() # data -> text

        # add force constant
        self.sections['BOND_FORCE_CONSTANT'].get_data()
        self.sections['BOND_FORCE_CONSTANT'].data.append(force)
        self.sections['BOND_FORCE_CONSTANT'].update_text()

        # add bond
        self.sections['BONDS_WITHOUT_HYDROGEN'].get_data()
        numbnd = self.sections['POINTERS'].data[15]
        self.sections['BONDS_WITHOUT_HYDROGEN'].data.append(i)
        self.sections['BONDS_WITHOUT_HYDROGEN'].data.append(j)
        self.sections['BONDS_WITHOUT_HYDROGEN'].data.append(numbnd)
        self.sections['BONDS_WITHOUT_HYDROGEN'].update_text()
        
def usage():
    print('usage:')
    print('  prmtop_bond_insert.py  your.prmtop')
    print('     -i  atom_A')
    print('     -j  aotm_B          (1-indexed)')
    print('     -e  bond_equil')
    print('     -f  force_const')

def main():

    import sys, getopt

    try:
        opt, args = getopt.gnu_getopt(sys.argv[1:], 'i:j:e:f:')
    except getopt.GetoptError as err:
        sys.stderr.write(str(err) + '\n')
        usage()
        sys.exit(2)

    if len(args) != 1:
        usage()
        sys.stderr.write('Input Error:\n')
        sys.stderr.write('  provide 1 prmtop\n')
        sys.exit(2)

    for o, a in opt:
        if o == '-i':   atom_i = int(a)
        elif o == '-j': atom_j = int(a)
        elif o == '-e': equil = float(a)
        elif o == '-f': force = float(a)

    # Do STUFF
    top = Prmtop(args[0])
    top.add_bond(atom_i, atom_j, force, equil)
    text = top.write()

    print text,
                
main()


