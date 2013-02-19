#!/usr/bin/env python3

from gaussian import GaussianLog

files = [
#    "g03_cluster_singlepoint.log",
    "g03_cluster_opt.log",
    "g03_cluster_scan.log",
#    "g09_cluster_singlepoint.log",
#    "g09_cluster_pdb_singlepoint.log",
#    "g09_cluster_opt.log",
#    "g09_cluster_pdb_opt.log",
#    "g09_cluster_scan.log",
#    "g09_cluster_pdb_scan.log",
#    "g09_oniom_singlepoint.log",
#    "g09_oniom_opt.log",
#    "g09_oniom_scan.log",
#    "g09_oniom_pdb_singlepoint.log",
    "g09_oniom_pdb_opt.log",
    "g09_oniom_pdb_scan.log"
]

for file in files:
    gaussian_file_name = file
    print('#########', file ,'#########')
    gaussian_log = GaussianLog(gaussian_file_name)
    print("Step number:", gaussian_log.grep_bytes['Step number'])
    print("SCF Done:",gaussian_log.grep_bytes['SCF Done:'])
    print("Orientation:", gaussian_log.grep_bytes['orientation:'])
    print("Oniom calculating en:", gaussian_log.grep_bytes['ONIOM: calculating energy.'])
    print("Converged?:", gaussian_log.grep_bytes['Converged?'])
    
