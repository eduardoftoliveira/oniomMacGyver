#!/usr/bin/env python3

from gaussian import GaussianCom

print("Trying to read qm_modred_gen.com, a simple gassian.com file")
gaussian_file_name = "qm_modred_gen.com"
simple_gaussian_com = GaussianCom(gaussian_file_name)
print("List of atoms:\n", simple_gaussian_com.atoms_list)
print("Everything seems ok\n\n")


print("Trying to read oniom.com, a simple ONIOM gassian.com file")
gaussian_file_name = "oniom.com"
simple_gaussian_com = GaussianCom(gaussian_file_name)
print("List of atoms:\n", simple_gaussian_com.atoms_list[0:100], " ... " )
print("Everything seems ok\n\n")
