#!/usr/bin/env python3

from gaussian import GaussianCom, GaussianLog2
GaussianLog = GaussianLog2


print("Trying to read qm_modred_gen.com, a simple gassian.com file")
gaussian_file_name = "qm_modred_gen.com"
gaussian_com = GaussianCom(gaussian_file_name)
print("List of atoms:\n", gaussian_com.atoms_list)
print("Everything seems ok\n\n")

print("Trying to read oniom.com, a simple ONIOM gassian.com file")
gaussian_file_name = "oniom.com"
gaussian_com = GaussianCom(gaussian_file_name)
print("List of atoms:\n", gaussian_com.atoms_list[0:100], " ... " )
print("Everything seems ok\n\n")

print("Trying to read oniom_pdb.com, a ONIOM gassian.com file with pdb info")
gaussian_file_name = "oniom_pdb.com"
gaussian_com = GaussianCom(gaussian_file_name)
print("List of atoms:\n", gaussian_com.atoms_list[0:100], " ... " )
print("Everything seems ok\n\n")

print("Trying to read oniom_pdb.log, a ONIOM gassian.log file with pdb info")
gaussian_file_name = "oniom_pdb.log"
gaussian_log = GaussianLog(gaussian_file_name)
print(gaussian_log._generate_summary())
print("Everything seems ok\n\n")

print("Trying to read big_scan_oniom.log, a 1.2 GB ONIOM gassian.log file")
gaussian_file_name = "big_scan_oniom.log"
gaussian_log = GaussianLog(gaussian_file_name)
print(gaussian_log._generate_summary())
print("Everything seems ok\n\n")

