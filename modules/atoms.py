#!/usr/bin/env python3

#python modules
import math

# my modules
from  elements_database import * 

# 3D Cross Product
def crossprod(a, b): 
    c = [
    a[1]*b[2] - a[2]*b[1],
    a[2]*b[0] - a[0]*b[2],
    a[0]*b[1] - a[1]*b[0]]
    return c

# Multidimensional dot product
def dotprod(a, b):
    if len(a) != len(b):
        raise RuntimeError('vectors must have same length')
    return sum([a[i] * b[i] for i in range(len(a))])

def vecnorm(V):
    sq = [v**2 for v in V]
    return math.sqrt(sum(sq))

def rad2deg(rads):
    return rads*(180/math.pi)

class Atom(object):    
    def __init__(self, element, x=None, y=None, z=None):
        if element.isdigit():
            element = int(element)
            self.atomic_number = element
            self.element = ATOMIC_NUMBER_DICT_REVERSE[element]
        else:
            self.element = element
            self.atomic_number  = ATOMIC_NUMBER_DICT[element]
        self.element = element
        self.x = float(x)
        self.y = float(y)
        self.z = float(z)
        self.coordinates = (self.x, self.y ,self.z)
        
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

    def dihedral(self, atom_2, atom_3, atom_4):
        """ Calculate dihedral considering this atom in the beggining"""
        b1 = [atom_2.coordinates[i] - self.coordinates[i] for i in range(3)]
        b2 = [atom_3.coordinates[i] - atom_2.coordinates[i] for i in range(3)]
        b3 = [atom_4.coordinates[i] - atom_3.coordinates[i] for i in range(3)]
        temp = [vecnorm(b2) * b1[i] for i in range(3)]
        y = dotprod(temp ,crossprod(b2,b3))
        x = dotprod(crossprod(b1,b2),crossprod(b2,b3))
        rad = math.atan2(y,x)
        return rad2deg(rad)

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
    def __init__(self,element, mm_type, charge, mask, x, y, z, layer, pdb_name, residue_name, residue_number, chain, link_element, link_mm_type, link_bound_to, link_scale1):
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
        self.residue_number = int(residue_number)
        self.chain = chain
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

    def get_pdb_line(self):
        o = 'ATOM  '                        # 1-6 ATOM
        o += ' '*5                          # 7-11 (NOT USED)
        o += ' '                            # 12
        o += '%4s' % (self.pdb_name)        # 13-16
        o += '%1s' % (self.layer)           # 17 altLoc
        o += '%3s' % (self.residue_name)    # 18-20 
        o += ' '                            # 21
        o += self.chain                     # 22 chain 
        o += '%4d' % (self.residue_number)  # 23-26 Res Num 
        o += ' '                            # 27 icode (NOT USED)
        o += '   '                          # 28-30
        o += '%8.3f' % (self.x)             # 31-38 x
        o += '%8.3f' % (self.y)             # 39-46 y
        o += '%8.3f' % (self.z)             # 47-54 z
        o += ' '*6                          # 55-60 occupancy (NOT USED)
        o += ' '*6                          # 61-66 tempFactor (NOT USED)
        o += ' '*10                         # 67-76
        o += '%2s' % self.element           # 77-78
        o += ' '*2                          # 79-80 charge (NOT USED)
        o += '\n'
        return o

