#!/usr/bin/env python3
"""Script to parametrize ligands with resp charges and gaff force field
It uses antechamber."""

#our modules
import mol2
import molecules

# python modules
import argparse
import textwrap
import subprocess


def create_g09():
    "Return a list of commands to create the gaussian input file"
    command = ("antechamber -fi mol2 -fo gcrt -i {0} -o {1} -gm '%mem=1gb' "
               "-gn '%nproc=8' -ch {1}.chk -nc {2}".format(MOL2, GAUCOM, CHARGE)
              )
    return [command,]

def run_g09():
    "Return command run gaussian calculation"
    command = "g09 {0} {1}".format(GAUCOM, GAULOG)
    return [command,]

def set_resp_gaff():
    "Return commands for calculating resp charges and set gaff parameters"
    
    commands = [
        #calculate and read resp charges into a ac file with correct atom order
        "antechamber -fi gesp -fo ac -i {0} -o {1} -c resp -pf yes -nc {2} "\
        .format(GESP, RESP_AC, CHARGE),
        "antechamber -fi ac -i {0} -c wc -cf {1} -pf yes"\
        .format(RESP_AC, CRG),
        "antechamber -fi mol2 -i {0} -c rc -cf {1} -fo ac -o {2} -pf yes"
        " -nc {3}".format(MOL2, CRG, RESP_AC, CHARGE),

        # set gaff atom names
        "atomtype -f ac -i {0} -o {1} -p gaff"\
        .format(RESP_AC, RESP_GAFF_AC),

        # generate topology and parameters files
        "prepgen -i {0} -o {1} -f car -rn {2}"\
        .format(RESP_GAFF_AC, PREP, UNIT_NAME),
        "parmchk -i {0} -o {1} -f prepc"\
        .format(PREP, FRCMOD),

    ]

    return commands

INSTRUCTION_TO_FUNCTION_DICT = {
    1: create_g09,
    2: run_g09,
    3: set_resp_gaff
}

CHOICES = sorted(INSTRUCTION_TO_FUNCTION_DICT.keys())

### Parser
PARSER = argparse.ArgumentParser(
    description='Use amber tools to calculate parameters for a molecule',
    formatter_class=argparse.RawTextHelpFormatter)

PARSER.add_argument('parts',
                    choices=CHOICES,
                    nargs='+',
                    type=int,
                    help=textwrap.dedent(
                        """Choose the step(s) of the parametrization:
                        {0[0]} - Create gaussian input file
                        {0[1]} - Run gaussian calculation
                        {0[2]} - Calculate RESP and set gaff parameters
                        """.format(CHOICES))
                   )

PARSER.add_argument('mol2',
                    help='molecule to parametrize in the mol2 format',
                   )

def unit(unit_name):
    "Check if the unit string has three letters"
    if len(unit_name) != 3:
        raise argparse.ArgumentTypeError("Unit name must have three letters")
    return unit_name

PARSER.add_argument('--unit_name',
                    type=unit,
                    help='Three letter name for the new molecule',
                    default='MOL'
                   )

PARSER.add_argument('--mol2_charge',
                    help='Uses the sum of the atomic charges in mol2 as charges',
                    action="store_true",
                   )

PARSER.add_argument('--charge',
                    type=int,
                    help='Charge of the molecule. Must be set if not zero.',
                    default=0
                   )

PARSER.add_argument('--dry',
                    help="Only print commands, do not run them.",
                    action="store_true",
                   )



ARGS = PARSER.parse_args()

PARTS = ARGS.parts
MOL2 = ARGS.mol2
UNIT_NAME = ARGS.unit_name
DRY = ARGS.dry
MOL2_CHARGE = ARGS.mol2_charge

if MOL2_CHARGE:
    mol2file = mol2.Mol2(MOL2)  
    mol = molecules.Molecule(UNIT_NAME, mol2file.atoms)
    CHARGE = int(round(mol.get_charge(),0))
else:
    CHARGE = ARGS.charge

GAUCOM = '{0}.com'.format(UNIT_NAME)
GAULOG = '{0}.log'.format(UNIT_NAME)
RESP_AC = '{0}_resp.ac'.format(UNIT_NAME)
GAFF_AC = '{0}_gaff.ac'.format(UNIT_NAME)
RESP_GAFF_AC = '{0}_resp_gaff.ac'.format(UNIT_NAME)
CRG = '{0}.crg'.format(UNIT_NAME)
PREP = "{0}.prep".format(UNIT_NAME)
FRCMOD = "{0}.frcmod".format(UNIT_NAME)
GESP = 'g09.gesp'

def main():
    "Parametrizes the ligand by calling antechamber"
    commands = []
    for possible_choice in CHOICES:
        if possible_choice in PARTS:
            commands.extend(INSTRUCTION_TO_FUNCTION_DICT[possible_choice]())


    for command in commands:
        if DRY:
            print(command)
        else:
            print("Running: {}".format(command))
            subprocess.call(command, shell=True)


if __name__ == "__main__":
    main()


