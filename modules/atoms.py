#!/usr/bin/env python3
""" Definition of the Atom Class and its subclasses"""

# python modules
import math
import numpy as np

# qt modules
from  elements_database import ATOMIC_NUMBER_DICT, \
                               ATOMIC_NUMBER_DICT_REVERSE, \
                               BONDS_DISTANCES_PAIRS

class Atom(object):
    """Basic Atom object with element and coordinates"""
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
        
    def __repr__(self):
        return self.element

    def get_coordinates(self):
        """Returs Atom coordinates as a numpy array"""
        return np.array((self.x, self.y, self.z))

    def distance(self, atom_b):
        """Return the distance to another atom"""
        distance = math.sqrt((self.x - atom_b.x)**2 + \
        (self.y - atom_b.y)**2 + (self.z - atom_b.z)**2)
        return distance
        
    def is_bonded_to(self, another_atom):
        """Check if this Atom is bonded to another Atom"""
        if self.distance(another_atom) > 3:  
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

    def angle(self, atom_2, atom_3, units = 'radian'):
        """Calculate the angle between three atoms. This atom in the middle"""
        
        d12 = self.distance(atom_2)
        d13 = self.distance(atom_3)
        d23 = atom_2.distance(atom_3)
        
        #round. To avoid things like 1.000000001
        angle = math.acos(round((d12**2 + d13**2 - d23**2)/(2*d12*d13), 7))
       
        if units.startswith('rad'):
            return angle
        elif units.startswith('deg'):
            return np.degrees(angle)


    def dihedral(self, atom2, atom3, atom4):
        """Calculate dihedral considering this atom in the beggining"""
        coord1 = self.get_coordinates()
        coord2 = atom2.get_coordinates()
        coord3 = atom3.get_coordinates()
        coord4 = atom4.get_coordinates()
        b1 = coord2 - coord1
        b2 = coord3 - coord2
        b3 = coord4 - coord3
        temp = np.linalg.norm(b2) * b1
        y = np.dot(temp, np.cross(b2, b3))
        x = np.dot(np.cross(b1, b2), np.cross(b2, b3))
        return np.degrees(math.atan2(y, x))

class QmmmAtom(Atom):
    """"QmmmAtom with all the data required by gaussian """
    def __init__(self, element, mm_type, charge, mask, x, y, z, layer, 
                 link_element, link_mm_type, link_bound_to, link_scale1):
                     
        Atom.__init__(self, element, x, y, z)
        self.atomic_number  = ATOMIC_NUMBER_DICT[element]
        self.mm_type = mm_type
        self.charge = float(charge)
        self.mask = mask
        self.layer = layer
        self.link_element   = link_element
        self.link_mm_type   = link_mm_type
        self.link_bound_to  = link_bound_to
        self.link_scale1    = link_scale1


class QmmmAtomPdb(QmmmAtom):
    """QmmmAtom with all the data required by gaussian includind PDB info"""
    def __init__(self, element, mm_type, charge, mask, x, y, z, layer, 
                 pdb_name, residue_name, residue_number, chain, link_element, 
                 link_mm_type, link_bound_to, link_scale1):
        
        QmmmAtom.__init__(self, element, mm_type, charge, mask, x, y, z, 
                layer, link_element, link_mm_type, link_bound_to, link_scale1)
        
        self.pdb_name = pdb_name
        self.residue_name = residue_name
        self.residue_number = int(residue_number)
        self.chain = chain

    def get_pdb_line(self):
        """Returns the Atom line for a pdb file"""
        line = 'ATOM  '                        # 1-6 ATOM HETATM
        line += ' '*5                          # 7-11 (NOT USED)
        line += ' '                            # 12
        line += '%4s' % (self.pdb_name)        # 13-16
        line += '%1s' % (self.layer)           # 17 altLoc
        line += '%3s' % (self.residue_name)    # 18-20 
        line += ' '                            # 21
        line += self.chain                     # 22 chain 
        line += '%4d' % (self.residue_number)  # 23-26 Res Num 
        line += ' '                            # 27 icode (NOT USED)
        line += '   '                          # 28-30
        line += '%8.3f' % (self.x)             # 31-38 x
        line += '%8.3f' % (self.y)             # 39-46 y
        line += '%8.3f' % (self.z)             # 47-54 z
        line += ' '*6                          # 55-60 occupancy (NOT USED)
        line += ' '*6                          # 61-66 tempFactor (NOT USED)
        line += ' '*10                         # 67-76
        line += '%2s' % self.element           # 77-78
        line += ' '*2                          # 79-80 charge (NOT USED)
        line += '\n'
        return line

def read_pdb_lines(lines_list):
    """Reads a list of PDB lines and return a list of Atoms
    Depending on the pdb info it creates Atom or QmmmAtomPdb"""
    
    atoms_list = []
    for line in lines_list:
        
        # if it contains residue info it saves a QmmmAtomPdb
        if line[0:6] == "ATOM  " or line[0:6] == "HETATM"\
                                 and line[17:20] != "   " :
            element = line[76:78].strip()
            mm_type = ""
            mm_charge = 0
            mask = "" #frozen
            x = line[30:38].strip()
            y = line[38:46].strip()
            z = line[46:54].strip()
            layer = line[16]
            pdb_atom_name = line[12:16].strip()
            pdb_res_name = line[17:20].strip()
            pdb_res_number = line[22:26].strip()
            pdb_chain = line[21].strip()
            link_element = ""
            link_mm_type = ""
            link_bound_to = ""
            link_scale1 = ""
            
            this_atom = QmmmAtomPdb(element, mm_type, mm_charge, mask, 
                                    x, y, z, layer, pdb_atom_name, 
                                    pdb_res_name, pdb_res_number, pdb_chain,
                                    link_element, link_mm_type, link_bound_to,
                                    link_scale1)
                                    
            atoms_list.append(this_atom)
        elif line[0:6] == "ATOM  " or line[0:6] == "HETATM":
            element = line[76:78].strip()
            x = line[30:38].strip()
            y = line[38:46].strip()
            z = line[46:54].strip()
            atoms_list.append(Atom(element, x, y, z))
            
    return atoms_list



