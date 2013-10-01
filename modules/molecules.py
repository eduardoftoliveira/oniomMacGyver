#!/usr/bin/env python3

from atoms import *

class Molecule(list):
    """ List of Atoms """
    def __init__(self, name ,atoms_list):
        list.__init__([])
        self.name = name
        self.atoms_list = atoms_list
        self.extend(atoms_list)

    def __repr__(self):
        return self.name

    def charge(self):
        charge = 0
        for atom in self.atoms_list:
           charge += atom.charge
        return charge
    
    def localize_charge(self):
        #not properly tested
        pos_x = pos_y = pos_z = pos_charge = 0
        neg_x = neg_y = neg_z = neg_charge = 0
        charge = 0
        for atom in self.atoms_list:
            if atom.charge > 0.001:
                pos_x += atom.x*atom.charge
                pos_y += atom.y*atom.charge
                pos_z += atom.z*atom.charge
                pos_charge += atom.charge
                charge += atom.charge
            elif atom.charge < 0.001:
                neg_x -= atom.x*atom.charge
                neg_y -= atom.y*atom.charge
                neg_z -= atom.z*atom.charge
                neg_charge -= atom.charge
                charge += atom.charge
        
        pos_x,pos_y,pos_z = [coord/pos_charge for 
                         coord in [pos_x,pos_y,pos_z]]
        
        neg_x,neg_y,neg_z = [coord/neg_charge for 
                         coord in [neg_x,neg_y,neg_z]]
               
        x = (pos_x*pos_charge/(pos_charge+neg_charge) + neg_x*neg_charge/(pos_charge+neg_charge))
        y = (pos_y*pos_charge/(pos_charge+neg_charge) + neg_y*neg_charge/(pos_charge+neg_charge))
        z = (pos_z*pos_charge/(pos_charge+neg_charge) + neg_z*neg_charge/(pos_charge+neg_charge))
        return charge,neg_x,neg_y,neg_z
         
    
    def center(self):
        """Return the center of the molecule (non-weighted)"""
        x_min = min([atom.x for atom in self.atoms_list])
        x_max = max([atom.x for atom in self.atoms_list])
        y_min = max([atom.y for atom in self.atoms_list])
        y_max = max([atom.y for atom in self.atoms_list])
        z_min = max([atom.z for atom in self.atoms_list])
        z_max = max([atom.z for atom in self.atoms_list])
        
        center = ( (x_min+x_max)/2 , (y_min+y_max)/2 , (z_min+z_max)/2 ) 
        return center

    def make_residues_list(self):
        residues_list = []
        this_residue = []
        this_residue_name = "{0.residue_name}{0.residue_number}".format(self.atoms_list[0])
        for atom in self.atoms_list:
            residue_name = "{0.residue_name}{0.residue_number}".format(atom)
            if residue_name == this_residue_name:
                this_residue.append(atom)
            elif residue_name != this_residue_name and this_residue_name != None:
                residues_list.append(Molecule(this_residue_name,this_residue))
                this_residue_name = residue_name
                this_residue = []
                this_residue.append(atom)
        #last residue
        residues_list.append(Molecule(this_residue_name,this_residue))
        return residues_list
    
    def build_connectivity(self):
        """ Returns a list of bonds between atoms, 
        order is always 1"""
        bonds_list = []
        for no, atom_a in enumerate(self.atoms_list):
            for atom_b in self.atoms_list[no+1:]:
                if atom_a.is_bonded_to(atom_b):
                    bond = Bond(atom_a, atom_b, order = 1)
                    bonds_list.append(bond)
        return bonds_list


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

class Bond():
    def __init__(self, atom_a, atom_b, order = 1):
        self.atom_a = atom_a
        self.atom_b = atom_b
        self.order = float(order)
        
    def __repr__(self):
        return (str((self.atom_a, self.atom_b,self.order)))

def QMMM_to_QM(atoms_list):
    """Takes a QM/MM atoms list and returns the QM system only.
    It corrects the type and position of link atoms"""
    SCALING = {"C":0.723886, "N":0.786011}
    qm_atoms_list = []
    for atom in atoms_list:
        if atom.layer[0] == 'H':
            qm_atom = Atom(atom.element, atom.x, atom.y, atom.z)
            qm_atoms_list.append(qm_atom)
        elif atom.link_element:
            linked_atom = atoms_list[int(atom.link_bound_to)-1]
            atom.x = (atom.x-linked_atom.x) *SCALING[linked_atom.element] + linked_atom.x
            atom.y = (atom.y-linked_atom.y) *SCALING[linked_atom.element] + linked_atom.y
            atom.z = (atom.z-linked_atom.z) *SCALING[linked_atom.element] + linked_atom.z
            qm_atom = Atom(atom.link_element, atom.x, atom.y, atom.z)
            qm_atoms_list.append(qm_atom)
        else:
            pass
    return qm_atoms_list

            





