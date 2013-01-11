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
        #round. To avoid things like 1.000000001
        angle = math.acos(round((d12**2 + d13**2 - d23**2)/(2*d12*d13),7))
        return angle


class QmmmAtom(Atom):
    def __init__(self, element, mm_type, charge, mask, x, y, z, layer, link_element, link_mm_type, link_bound_to, link_scale1):
        self.element = element
        self.x = float(x)
        self.y = float(y)
        self.z = float(z)
        self.coordinates = (self.x, self.y ,self.z)
        self.atomic_number  = ATOMIC_NUMBER_DICT[element]
        self.mm_type = mm_type
        self.charge = float(charge)
        self.mask = mask
        self.layer = layer
        self.link_element   = link_element
        self.link_mm_type   = link_mm_type
        self.link_bound_to  = link_bound_to
        self.link_scale1    = link_scale1
        # self.link_scale2
        # self.link_scale3

class QmmmAtomPdb(QmmmAtom):
    def __init__(self,element, mm_type, charge, mask, x, y, z, layer, pdb_name, residue_name, residue_number, link_element, link_mm_type, link_bound_to, link_scale1):
        self.element = element
        self.x = float(x)
        self.y = float(y)
        self.z = float(z)
        self.coordinates = (self.x, self.y ,self.z)
        self.atomic_number  = ATOMIC_NUMBER_DICT[element]
        self.mm_type = mm_type
        self.charge = float(charge)
        self.mask = mask
        self.layer = layer
        self.pdb_name = pdb_name
        self.residue_name = residue_name
        self.residue_number = residue_number
        self.link_element   = link_element
        self.link_mm_type   = link_mm_type
        self.link_bound_to  = link_bound_to
        self.link_scale1    = link_scale1
        # self.link_scale2
        # self.link_scale3

    def get_formatted_line(self):
        line = ''

        atom_type_charge = " {0.element}-{0.mm_type}-{0.charge:.6f}"\
                            .format(self)
        pdb_info = '(PDBName=%s,ResName=%s,ResNum=%s)' % (self.pdb_name, self.residue_name, self.residue_number)
        
        line += atom_type_charge
        line += pdb_info
        line += ' '*(61-len(line))                                  # For a good alignment
        line += "{0.mask:>2s}".format(self)                         # Mask
        line += "{0.x:>14.8f}{0.y:>14.8f}{0.z:>14.8f}".format(self) # X,Y,Z
        line += " {0.layer:s}".format(self)                          # Layer

        if self.link_element != None:
            line += ' %s' % (self.link_element)                     # Link atom ELEMENT
        if self.link_mm_type != None:
            line += '-%s' % (self.link_mm_type)                     # Link atom MM type
        if self.link_bound_to != None:
            line += ' %d' % (int(self.link_bound_to))               # Link BOUND TO
        if self.link_scale1 != None:
            line += ' %f' % (float(self.link_scale1))               # Link atom scale factor

        line += '\n'
        return line




       
