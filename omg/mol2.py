#!/usr/bin/env python

# our python modules
import molecules
import iolines
import openbabel as ob

#create a periodic table object                                                 
PERIODIC_TABLE = ob.OBElementTable()

class Mol2():
    def __init__(self, name):
        self.name = name
        self.atoms = self.read_atoms()
        self.bonds = self.read_bonds()

    def read_atoms(self):
        "Returns a list of atoms"
        with open(self.name, 'r') as mol2_file:
            lines = mol2_file.readlines()
            
        atoms = []
        init_atoms = lines.index("@<TRIPOS>ATOM\n") + 1
        for line in lines[init_atoms:]:
            if line.strip() and "@<TRIPOS>" not in line:
                atoms.append(iolines.mol22atom(line))
            else:
                break
        return atoms

    def read_bonds(self):
        "Returns a list of bonds"
        with open(self.name, 'r') as mol2_file:
            lines = mol2_file.readlines()
        bonds = []
        init_bonds = lines.index("@<TRIPOS>BOND\n") + 1 
        for line in lines[init_bonds:]:
            if line.strip() and "@<TRIPOS>" not in line:
                index1, index2, order = iolines.mol22bond(line)
                bond = molecules.Bond(self.atoms[index1-1], 
                                      self.atoms[index2-1],
                                      order)
                bonds.append(bond)
            else:
                break
        
        return  bonds

    def write_simpler_mol2( self, output_file ):
        """obabel does not work well with xleap mol2, this functions transforms\
        a xleap mol2 to a simpler (element only) that can be read by obabel """
        with open( output_file, 'w') as out_mol2:
            header_lines = []
            header_lines.append("@<TRIPOS>MOLECULE\nMOL\n")
            header_lines.append( "{:>4} {:>4}\n".format( 
                len(self.atoms), 
                len(self.bonds) ))
            header_lines.append("SMALL\nRESP\n\n")
    
            atoms_lines = []
            atoms_lines.append( "@<TRIPOS>ATOM\n" )

            for i, atomo in enumerate(self.atoms):
                atoms_lines.append(\
                "{:>7} {elem} {:17.4f} {:10.4f} {:10.4f} {elem} \n".format(\
                        i+1, 
                        atomo.GetX(),
                        atomo.GetY(),
                        atomo.GetZ(),
                        elem = PERIODIC_TABLE.GetSymbol( atomo.GetAtomicNum() ) ))

            bonds_lines = []
            bonds_lines.append( "@<TRIPOS>BOND\n" )
            bonds_lines.append( "".join( iolines.bonds2lines( self.atoms, self.bonds )) )
            print bonds_lines
            out_mol2.write( "".join(header_lines) )
            out_mol2.write( "".join(atoms_lines) )
            out_mol2.write( "".join(bonds_lines) )



def mol2_rm_lp(filename, delhydrogens = True):
    """remove lone pairs from mol2 Gold file"""

    RTIs = { 'Comments' : [] } 
    key = 'Comments'
    orderedkeys = []
    with open(filename) as f:
        """read comments"""
        for line in f:
            if line.startswith('@<TRIPOS>'):
                key = line.split('@<TRIPOS>')[1].strip()
                orderedkeys.append(key)
                RTIs[key] = []
            else:
                RTIs[key].append(line) 

    # get n_atoms, n_bonds
    n_atoms = 0
    valid_atom_ids = []
    new_atoms = []
    coords = []
    for (i, line) in enumerate(RTIs['ATOM']):
        fields = line.split()
        try:
            el = fields[1]
        except:
            print (line)
        atype = fields[5]
        if el != '****' and atype != 'LP':
            if not (delhydrogens and el == 'H'):
                n_atoms += 1 
                new_atoms.append(line)
                valid_atom_ids.append(i+1)
                x = float(fields[2])
                y = float(fields[3])
                z = float(fields[4])
                coords.append((x,y,z))
    RTIs['ATOM'] = new_atoms

    n_bond = 0
    new_bonds = []
    for line in RTIs['BOND']:
        fields = line.split()
        atom1 = int(fields[1])
        atom2 = int(fields[2])
        order = 1
        if atom1 in valid_atom_ids and atom2 in valid_atom_ids:
            n_bond += 1
            new_bonds.append('%6d %5d %5d %4d\n' % (
                n_bond,
                valid_atom_ids.index(atom1) +1,
                valid_atom_ids.index(atom2) +1,
                order))
    RTIs['BOND'] = new_bonds

    # update n_atoms, n_bonds in @<TRIPOS>MOLECULE
    theline = RTIs['MOLECULE'][1]
    fields = theline.split()
    therest = ''.join(fields[2:])
    RTIs['MOLECULE'][1] = '%6d %5d %5s\n' % (n_atoms, n_bond, therest)

    # Write Stuff
    newtext = ''.join(RTIs['Comments'])
    for key in orderedkeys:
        newtext += '@<TRIPOS>%s\n' % key
        newtext += ''.join(RTIs[key])

    return newtext, coords

