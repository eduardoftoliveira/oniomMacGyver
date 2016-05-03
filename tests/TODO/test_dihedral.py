#!/usr/bin/env python3

from gaussian import GaussianCom as G
import pybel

# Four atoms and reference value as in GaussView
dihedrals = [
    (130, 128, 131, 133, 41.760),
    (932, 931, 934, 935, -7.949),
    (129, 128, 131, 132, -19.438),
    (936, 934, 931, 932, 166.561),
]

x = G('oniom.com')
mol = pybel.ob.OBMol()
for dihedral in dihedrals:
    atom = x.atoms_list[dihedral[0]]
    output = mol.GetTorsion(
        atom,
        x.atoms_list[dihedral[1]],
        x.atoms_list[dihedral[2]],
        x.atoms_list[dihedral[3]])
    print('Expected %4.3f, got %4.3f' % (dihedral[4], output))
