#!/usr/bin/env python

import atoms, iolines, sys
from copy import deepcopy

BACKBONE = ['C', 'CA', 'O', 'N']
MUT = 'ALA'

def readpdbfile(filename):
    atoms = []
    with open(filename) as f:
        for line in f:
            if line[0:6] in ['ATOM  ', 'HETATM']:
                atoms.append(iolines.pdb2atom(line))
            if line.strip() == 'TER':
                atoms.append('TER\n')
    return atoms

def writepdbfile(atoms, filename):
    with open(filename, 'w') as f:
        for atom in atoms:
            if atom == 'TER\n':
                f.write('TER\n')
            else:
                f.write(iolines.atom2pdb(atom))

def mutate(atoms, mutation):
    new_atoms = []
    resnum = mutation[0]
    chain = mutation[1]
    for atom in atoms:
        if atom != 'TER\n':
            if atom.resinfo.resnum == resnum and atom.resinfo.chain == chain:
                if atom.resinfo.name in BACKBONE:
                    newatom = deepcopy(atom)
                    newatom.resinfo.resname = MUT
                    new_atoms.append(newatom)
            else:
                new_atoms.append(atom)
        else:
            new_atoms.append(atom)
    return new_atoms

def read_mutations(filename):
    """ each line in filename looks like: 137_A
        out put is a tuple:         (137, 'A')  """
    mutations = []
    with open(filename) as f:
        for line in f:
            resnum, chain = line.strip().split('_')
            resnum = int(resnum)
            mutations.append((resnum, chain))
    return mutations


# USAGE:    ./mut2ala.py    mutations.txt   model.pdb
mutations = read_mutations(sys.argv[1])
atoms = readpdbfile(sys.argv[2])

for mut in mutations:
    mutated = mutate(atoms, mut)
    out_filename = '%d_%s.pdb' % mut
    writepdbfile(mutated, out_filename)
    

