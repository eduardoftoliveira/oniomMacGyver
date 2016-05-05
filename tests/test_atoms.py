#!/usr/bin/env python

# python modules
import unittest


# qt modules
import atoms

class test_atoms(unittest.TestCase):

    good_inputs = ( ('H', (2,6,1)),
                    ('C', (1.,2.,3.)),
                  )

    bad_elements_inputs = ( ('GF', (0,0,0)),
                           ('z', (0,0,0)),
                           ('5', (0,0,0))
                         )

    distance_pairs = ( ( ('H', (2.,6.,1.)), ('C', (1.,2.,3.)), 4.58257569495584),
                     )

    def test_set_element_good(self):
        """Correct atom types are well read into Atom"""
        for test_input in self.good_inputs:
            atom = atoms.Atom(test_input[0], test_input[1])
            self.assertEqual(atom.GetType() ,test_input[0])

    def test_set_coordinates_good(self):
        """Correct atom coordinates are well read into Atom"""
        for test_input in self.good_inputs:
            atom = atoms.Atom(test_input[0], test_input[1])
            self.assertEqual((atom.x(), atom.y(), atom.z()),test_input[1])

    def test_good_coordinates(self):
        """Correct coordinates are well read. Must be floats"""
        for test_input in self.good_inputs:
            atom = atoms.Atom(test_input[0], test_input[1])
            self.assertEqual(atom.x(), float(test_input[1][0]))
            self.assertEqual(atom.y(), float(test_input[1][1]))
            self.assertEqual(atom.z(), float(test_input[1][2]))

    def test_distance(self):
        """Distances between atoms are well calculated"""
        for pair in self.distance_pairs:
            atom_A = atoms.Atom(pair[0][0], pair[0][1])
            atom_B = atoms.Atom(pair[1][0], pair[1][1])
            self.assertAlmostEqual(atom_A.GetDistance(atom_B), pair[2])

    def test_angle(self):
        """Angles between atoms are well calculated"""
        pass
        #TODO


    def test_dihedrals(self):
        """Dihedrals between atoms are well calculated"""
        pass
        #TODO

    def test_is_bond_to(self):
        """Bonds between atoms are well identified"""
        pass
        #TODO

if __name__ == '__main__':
    unittest.main()

