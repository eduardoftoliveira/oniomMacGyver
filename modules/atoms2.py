#!/usr/bin/env python3

#python modules
import math

# my modules
from  elements_database import * 

class Atom(object):    
    def __init__(self, element, x=None, y=None, z=None):
        self.element = element
        self.x = float(x)
        self.y = float(y)
        self.z = float(z)
        self.coordinates = (self.x, self.y ,self.z)
        self.atomic_number  = ATOMIC_NUMBER_DICT[element]
        
    def __repr__(self):
        return self.element

    def distance(self, atom_b):
        """ Return the distance to another atom"""
        distance = math.sqrt((self.x-atom_b.x)**2 + \
        (self.y-atom_b.y)**2 + (self.z-atom_b.z)**2)
        return distance

    def is_bonded_to(self, another_atom):
        """ Check if the is bonded to another  atom"""
        if self.distance(another_atom) > 3:    #discard far atoms
            return False
        if self.distance(another_atom) < 0.1:    #same atom
            return False
        if self.atomic_number < another_atom.atomic_number:
            pair_name = "{}-{}".format(self.element, another_atom.element)
        else:
            pair_name = "{}-{}".format(another_atom.element, self.element)
        try:
            single_bond_distance = BONDS_DISTANCES_PAIRS[pair_name]
        except KeyError as err:
            single_bond_distance = 0
            print("There is no saved distance for", err)

        if self.distance(another_atom) < single_bond_distance +\
        0.30*single_bond_distance:   #30% is a good tolerance?
            return True
        else:
            return False

    def angle(self, atom_2, atom_3):
        """Calculate the angle between three atoms. This atom in the middle"""
        d12 = self.distance(atom_2)
        d13 = self.distance(atom_3)
        d23 = atom_2.distance(atom_3)        
        angle = math.acos(  (d12**2 + d13**2 - d23**2)/(2*d12*d13)  )
        return angle


class QmmmAtom(Atom):
    def __init__(self, element, mm_type, charge, mask, x, y, z, layer):
        super().__init__(element, x, y, z)
        self.mm_type = mm_type
        self.charge = float(charge)
        self.mask = mask
        self.layer = layer

class QmmmAtomPdb(QmmmAtom):
    def __init__(self,element, mm_type, charge, mask, x, y, z, layer, pdb_name, residue_name, residue_number):
        super().__init__(element, mm_type, charge, mask, x, y, z, layer)
        self.pdb_name = pdb_name
        self.residue_name = residue_name
        self.residue_number = residue_number
       
