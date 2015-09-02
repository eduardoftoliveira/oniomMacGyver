#!/usr/bin/env python

# our python modules
import molecules
import iolines


class Mol2():
    def __init__(self, name):
        self.name = name
        self.atoms = self.read_atoms()
        self.bonds = self.read_bonds()

    def read_atoms(self):
        "Returns a list of atoms"
        with open(self.name, 'r') as mol2_file:
            lines = mol2_file.readlines()
            
        atoms = []
        init_atoms = lines.index("@<TRIPOS>ATOM\n") + 1
        for line in lines[init_atoms:]:
            if line.strip() and "@<TRIPOS>" not in line:
                atoms.append(iolines.mol22atom(line))
            else:
                break
        return atoms

    def read_bonds(self):
        "Returns a list of bonds"
        with open(self.name, 'r') as mol2_file:
            lines = mol2_file.readlines()
        bonds = []
        init_bonds = lines.index("@<TRIPOS>BOND\n") + 1 
        for line in lines[init_bonds:]:
            if line.strip() and "@<TRIPOS>" not in line:
                index1, index2, order = iolines.mol22bond(line)
                bond = molecules.Bond(self.atoms[index1-1], 
                                      self.atoms[index2-2],
                                      order)
                bonds.append(bond)
            else:
                break
        
        return  bonds

