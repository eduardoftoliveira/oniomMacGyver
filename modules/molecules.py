#!/usr/bin/env python3

class Molecule(list):
    """ List of Atoms """
    def __init__(self, name ,atoms_list):
        list.__init__([])
        self.name = name
        self.atoms_list = atoms_list
        self.extend(atoms_list)

    def __repr__(self):
        return self.name

    def center(self):
        """Return a tuple with the coordinates of the center of the molecule"""
        X = Y = Z = -9999
        y = x = z = 9999
        
        for atom in self.atoms_list:  #find min and max coordinates
            if atom.x < x : x = atom.x
            if atom.x > X : X = atom.x 
            if atom.y < y : y = atom.y
            if atom.y > Y : Y = atom.y 
            if atom.z < z : z = atom.z
            if atom.z > Z : Z = atom.z 
        center = ( (x+X)/2 , (y+Y)/2 , (z+Z)/2 ) 
        return center


def create_molecules(atoms_list):
    """ Turns a list of atoms into a list of molecules
based on the distance between the atoms"""

    molecules_list = []
    #atom_a is the first atom of each molecule
    #atom_b are the atoms of the growing molecule
    #atom_c are the to-check-atoms in atoms-list
    
    #take an atom_a and trough various iterations grow a molecule based on distance
    while atoms_list:
        atom_a = atoms_list[0]
        growing_molecule = [atom_a]
        atoms_list.remove(atom_a)
        while True:
            initial_len = len(growing_molecule)
            for atom_b in growing_molecule:
                for atom_c in atoms_list:
                    if atom_b.is_bonded_to(atom_c):  
                        growing_molecule.append(atom_c)
                        atoms_list.remove(atom_c)
            
            if len(growing_molecule) == initial_len: #stoped growing
                molecules_list.append(growing_molecule)
                break
                
    proper_molecules_list = [] #molecules belonging to the Molecule class
    for molecule in molecules_list:
        mol_name = "Res{}".format(molecules_list.index(molecule)+1)
        proper_molecule = Molecule(mol_name, molecule)
        proper_molecules_list.append(proper_molecule)
    
    return proper_molecules_list
