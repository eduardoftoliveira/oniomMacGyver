#!/usr/bin/env python
"""Script to read a com file created by amboniom and make changes
required to oniom calculation."""

# python modules
import argparse

#our modules
import molecules
import gaussian

PARSER = argparse.ArgumentParser(
  description = 'Reads the output of amboniom and makes changes for oniom',
  formatter_class = argparse.RawTextHelpFormatter)

PARSER.add_argument('in_gaucom',
                    help = 'gaussian model file')
                    
PARSER.add_argument('out_gaucom',
                    help = 'gaussian model file')

ARGS = PARSER.parse_args()
IN_GAUCOM = ARGS.in_gaucom
OUT_GAUCOM = ARGS.out_gaucom

def main():
    in_file = gaussian.GaussianCom(IN_GAUCOM)
    system = molecules.Molecule('system',in_file.atoms_list)
    charge = system.get_charge()
    charge_line = '{0} 1 {0} 1 {0} 1\n'.format(int(charge))
    in_file.multiplicity_line = charge_line
    route_section = """%nproc=8
%mem=1gb
# oniom(b3lyp/6-31g(d):amber=softonly)=embed geom(notest,connectivity)\n"""
    in_file.route_section = route_section
    for no, atom in enumerate(in_file.atoms_list):
        if atom.resinfo.resname != 'WAT':
            in_file.atoms_list[no].oniom.layer = 'H'

    in_file.redo_connectivity_list()
    in_file.write_to_file(OUT_GAUCOM)      

if __name__ == "__main__":
    main()


