#!/usr/bin/env python3

##
##
## TODO - NEEDS URGENT REWRITING
##

#python modules
from os import path
import sys
import subprocess
#my modules
    #scripts do ze (inclui na minha $PYTHONPATH no bashrc que eh chamado pelo meu bash_profile)
from gaussian import GaussianLog
import atoms
import iolines

                            

def main():
    #confirmar se introduziu ficheiro de input
    if len(sys.argv) == 1 or sys.argv[1] in ["-h", "--help"]:
        print("Como usar: {0} file.log ").format(sys.argv[0])
        sys.exit()

    #ficheiro entrada (output do gaussian)
    global filein
    filein = sys.argv[1]
    #transformar o ficheiro log aberto numa variavel global (ler com o GaussianLog)



############## INICIO ############## 
main()

#ler os bytes de todo o ficheiro e fazer todos os atributos d
gaussianlog = GaussianLog(filein)
for i, scan_step in enumerate( gaussianlog.grep_bytes['Step number'] ):
    print( "Scan", i, ": ", len(gaussianlog.grep_bytes['Step number'][i]), "opt steps" )

scan_step = input('Type "scan_step" that you which to extract. Options: scan_step="all": ')
opt_step = input('Type "opt_step" that you which to extract. Options: opt_step="all": ')

#verificar se existe o ficheiro
output = input('Type the name of the output file: ')
if path.exists(output + '.pdb'):
    raise RuntimeError('%s already exists' %(str(output)+".pdb"))
open_output = open(str(output) + ".pdb", "w")

#casos em que extraio todos os scans
if str(scan_step) == 'all':
    print(len(gaussianlog.grep_bytes['orientation:']))
    #falta meter aqui a opcao opt_step =='all' , mas neste caso nao faz muito sentido
    #if opt_step == 'all':

    opt_step = int(opt_step)
    print(len(gaussianlog.grep_bytes['orientation:']))
    for i in range(len(gaussianlog.grep_bytes['orientation:'])):
        atoms_structure = gaussianlog.read_geometry(opt_step, i)
        for j,atom in enumerate(atoms_structure):
            pdb_obj = atoms.PDBinfo('ATOM', j+1 )              
            #res_obj = atoms.RESinfo(atom.element,'',0,'') #quando nao ha info pdb 
            #atom.set_resinfo(res_obj)
            atom.set_pdbinfo(pdb_obj)
            atom.pdbinfo.altloc = atom.oniom.layer
            open_output.write(iolines.atom2pdb(atom))
        open_output.write("END\n")

#casos em que so extraio de um scan
else:
    scan_step = int(scan_step)
    #todos os opt
    if opt_step == 'all':
        for i in range(len(gaussianlog.grep_bytes['orientation:'][scan_step])):
            atoms_structure = gaussianlog.read_geometry(i, scan_step)
            for j,atom in enumerate(atoms_structure):
                pdb_obj = atoms.PDBinfo('ATOM', j+1)
                atom.set_pdbinfo(pdb_obj)
                atom.pdbinfo.altloc = atom.oniom.layer
                open_output.write(iolines.atom2pdb(atom))
            open_output.write("END\n")
    #1 opt
    else:
        opt_step = int(opt_step)
        atoms_structure = gaussianlog.read_geometry(opt_step, scan_step)
        for j,atom in enumerate(atoms_structure):
            pdb_obj = atoms.PDBinfo('ATOM', j+1)
            atom.set_pdbinfo(pdb_obj)
            atom.pdbinfo.altloc = atom.oniom.layer
            open_output.write(iolines.atom2pdb(atom))
        open_output.write("END\n")
    

open_output.close()

#if str(opt_step) == 'all' or str(scan_step) == 'all':
#    with open('temp_pymolscript.pml', "w") as temp_pymolscript:
#        temp_pymolscript.write(\
#        str( 'cmd.load( "' ) + str(output) + str('.pdb", format="pdb", multiplex=0)\n' )\
#        + str( 'cmd.intra_fit( "' ) + str(output) + str( '" , state=0)\n' )\
#        + str( 'cmd.save( "' ) + str(output) + str( '.pdb", selection="') + str(output) + str('", state=0, format="pdb")\n' )\
#        + str( 'cmd.quit \n')
#        )
#        
#    subprocess.call('pymol -qc temp_pymolscript.pml', shell=True)
#    subprocess.call('rm temp_pymolscript.pml', shell=True)






