#!/usr/bin/env python3

# python modules
import numpy as np
import geom

# qt modules
from  elements_database import ATOMIC_NUMBER_DICT, \
                               ATOMIC_NUMBER_DICT_REVERSE, \
                               BONDS_DISTANCES_PAIRS

class Atom(object):
    def __init__(self, element, xyz):
        """x = Atom('H', (1.0, 2.0, 3.0))"""
        self.set_element(element)
        self.set_coordinates(xyz)
        self.mm = None
        self.oniom = None
        self.resinfo = None
        self.pdbinfo = None
        
    def __repr__(self):
        return self.element

    def set_element(self, element):
        if type(element) == str:
            if element.isdigit():
                element = int(element)
            else:
                self.element = element
                self.atomic_nr = ATOMIC_NUMBER_DICT[element]
        if type(element) == int:
            self.element = ATOMIC_NUMBER_DICT_REVERSE[element]
            self.atomic_nr = element
        elif type(element) != str:
            raise RuntimeError('Bad element type: must be str/int/None')

    def set_coordinates(self, xyz):
        """xyz = (x, y, z)"""
        self.x, self.y, self.z = [float(coord) for coord in xyz]

    # existance of attributes to be checked with hasattr(x, 'oniom')

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
        return np.sqrt(
            (self.x - atom_b.x)**2 + 
            (self.y - atom_b.y)**2 + 
            (self.z - atom_b.z)**2) 
            
        # return geom.distance(
        #     self.get_coordinates(),
        #     atom_b.get_coordinates())

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
        atomic_nr_tuple = (self.atomic_nr, atom_b.atomic_nr)
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
        self.charge = charge

class Oniom(object):
    def __init__(self, mask, layer):
        self.mask = mask
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
    def __init__(self, keyword, serial):
        self.keyword = keyword
        self.serial = serial
        self._set_empty_attr()

    def _set_empty_attr(self):
        self.occupancy      = None
        self.bfact          = None
        self.altloc         = None
        self.icode          = None
        self.formalcharge   = None

    ### def set_altloc(altloc):
    ###     self.altloc = altloc

    ### def set_icode(icode):
    ###     self.icode = icode

    ### def set_occupancy(occupancy):
    ###     self.ocuupancy = occupancy

    ### def set_bfact
    ### def set_frmlcharge
 

class PDBQT(object):
    """ atom with pdb and mm !!!"""


