from math import sqrt

def transpose_list_of_lists(mat):
    """
        input:  list of X lists with Y items
        output: list of Y lists with X items
    """
    X = len(mat)
    Ys = [len(row) for row in mat]
    if len(set(Ys)) != 1:
        raise RuntimeError('needed matrix, got lists of varying length')
    Y = Ys[0]
    outmat = []
    for j in range(Y):
        newrow = []
        for i in range(X):
            newrow.append(mat[i][j])
        outmat.append(newrow)
    return outmat

def starfloat(text):
    try:
        out = float(text)
        return out
    except:
        if text.strip().startswith('*'):
            return float('+inf')
        else:
            raise RuntimeError('needed float or *, got %s' % text)

def avg(vec):
    return float(sum(vec))/len(vec)

def std(vec):
    a = avg(vec)
    return sqrt(sum([(x-a)**2 for x in vec])/len(vec))

def mol2_rm_lp(filename, delhydrogens = True):
    """remove lone pairs from mol2 Gold file"""

    RTIs = { 'Comments' : [] } 
    key = 'Comments'
    orderedkeys = []
    with open(filename) as f:
        """read comments"""
        for line in f:
            if line.startswith('@<TRIPOS>'):
                key = line.split('@<TRIPOS>')[1].strip()
                orderedkeys.append(key)
                RTIs[key] = []
            else:
                RTIs[key].append(line) 

    # get n_atoms, n_bonds
    n_atoms = 0
    valid_atom_ids = []
    new_atoms = []
    coords = []
    for (i, line) in enumerate(RTIs['ATOM']):
        fields = line.split()
        try:
            el = fields[1]
        except:
            print (line)
        atype = fields[5]
        if el != '****' and atype != 'LP':
            if not (delhydrogens and el == 'H'):
                n_atoms += 1 
                new_atoms.append(line)
                valid_atom_ids.append(i+1)
                x = float(fields[2])
                y = float(fields[3])
                z = float(fields[4])
                coords.append((x,y,z))
    RTIs['ATOM'] = new_atoms

    n_bond = 0
    new_bonds = []
    for line in RTIs['BOND']:
        fields = line.split()
        atom1 = int(fields[1])
        atom2 = int(fields[2])
        order = 1
        if atom1 in valid_atom_ids and atom2 in valid_atom_ids:
            n_bond += 1
            new_bonds.append('%6d %5d %5d %4d\n' % (
                n_bond,
                valid_atom_ids.index(atom1) +1,
                valid_atom_ids.index(atom2) +1,
                order))
    RTIs['BOND'] = new_bonds

    # update n_atoms, n_bonds in @<TRIPOS>MOLECULE
    theline = RTIs['MOLECULE'][1]
    fields = theline.split()
    therest = ''.join(fields[2:])
    RTIs['MOLECULE'][1] = '%6d %5d %5s\n' % (n_atoms, n_bond, therest)

    # Write Stuff
    newtext = ''.join(RTIs['Comments'])
    for key in orderedkeys:
        newtext += '@<TRIPOS>%s\n' % key
        newtext += ''.join(RTIs[key])

    return newtext, coords
    
        

                

