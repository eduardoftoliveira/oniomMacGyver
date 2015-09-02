#!/usr/bin/env python3

# python modules
import numpy as np
import geom

# qt modules
from  elements_database import ATOMIC_NUMBER_DICT, \
                               ATOMIC_NUMBER_DICT_REVERSE, \
                               BONDS_DISTANCES_PAIRS

class Atom(object):
    """A container for all the information relative to an atom

    Attributes:
        element (str)
        x (float)
        y (float)
        z (float)
        
    
    Other info is kept in its own object inside atom:
        - mm      (molecular mechanics)
        - oniom   (oniom info)
        - resinfo (information about the residue the atom belongs to)
        - pdbinfo (information for pdb files)
    """
    
    def __init__(self, element, xyz):
        """
        
        Args:
            element (one letter str): Element of this atom
            xyz (list): a list with the x, y, z coordinates
       
        Example:
            Atom('H', (1.0, 2.0, 3.0))
        """
        self.element = self._set_element(element)
        #self.x, self.y, self.z = self.set_coordinates(xyz) (only works at init)
        self.set_coordinates(xyz)
        self.mm = None
        self.oniom = None
        self.resinfo = None
        self.pdbinfo = None
        
    def __repr__(self):
        return self.element

    def _set_element(self, element):
        if element in ATOMIC_NUMBER_DICT:
            return element
        else:
            raise RuntimeError("I don know this atom: {}".format(element))

    def set_coordinates(self, coordinates):
        self.x, self.y, self.z = [float(i) for i in coordinates]
        #return [float(i) for i in coordinates]

    def set_mm(self, mm_obj):
        self.mm = mm_obj

    def set_oniom(self, oniom_obj):
        self.oniom = oniom_obj

    def set_resinfo(self, resinfo_obj):
        self.resinfo = resinfo_obj

    def set_pdbinfo(self, pdbinfo_obj):
        self.pdbinfo = pdbinfo_obj

    def get_coordinates(self):
        """Returs Atom coordinates as a numpy array"""
        return np.array((self.x, self.y, self.z))

    def distance(self, atom_b):
        return geom.distance( self.get_coordinates(),
                              atom_b.get_coordinates())

    def angle(self, atom_b, atom_c):
        """self in center: b-self-c"""
        return geom.angle(
            self.get_coordinates(),
            atom_b.get_coordinates(),
            atom_c.get_coordinates())

    def dihedral(self, atom_b, atom_c, atom_d):
        return geom.dihedral(
            self.get_coordinates(),
            atom_b.get_coordinates(),
            atom_c.get_coordinates(),
            atom_d.get_coordinates())
        
    def is_bonded_to(self, atom_b):
        """Check if this Atom is bonded to another Atom"""
        tolerance = 0.30  #30% is a good tolerance?
        dist = self.distance(atom_b)
        if dist > 3 or dist < 0.1:  
            return False
        atomic_nr_tuple = (ATOMIC_NUMBER_DICT[self.element], 
                           ATOMIC_NUMBER_DICT[atom_b.atomic_nr])
        bond_key = "{}-{}".format(min(atomic_nr_tuple), max(atomic_nr_tuple))
        try:
            expected_dist = BONDS_DISTANCES_PAIRS[bond_key]
        except KeyError as err:
            expected_dist = 0
            print("There is no saved distance for", err)
        return dist < (1+tolerance)*expected_dist

class MM(object):
    def __init__(self, atype, charge):
        self.atype = atype
        self.charge = float(charge)

class Oniom(object):
    def __init__(self, mask, layer):
        self.mask = int(mask)
        self.layer = layer
        self.has_link = False
        self.link_atom = None
        self.link_bound_to = None
        self.link_scale1 = None

    def set_link(self, atom, bound_to, scale1):
        self.link_atom = atom
        self.link_bound_to = int(bound_to)
        self.link_scale1 = float(scale1)
        self.has_link = True

class RESinfo(object):
    """ pdb info in g09 Oniom"""
    def __init__(self, name, resname, resnum, chain):
        self.name = name
        self.resname = resname
        self.resnum = int(resnum)
        self.chain = chain

class PDBinfo(object):
    def __init__(self, keyword, serial, 
        occupancy = .0, bfact = .0, altloc = "", icode = "",
        formalcharge = ""):
        self.keyword = keyword
        self.serial = serial
        self.occupancy      = occupancy
        self.bfact          = bfact
        self.altloc         = altloc
        self.icode          = icode
        self.formalcharge   = formalcharge

