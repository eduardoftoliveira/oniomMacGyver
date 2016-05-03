#!/usr/bin/env python

from os.path import splitext
from os import path
import sys
import subprocess
from gaussian import GaussianLog as GAULOG
from gaussian import GaussianCom as GAUCOM
import atoms, iolines
import getopt

def usage():
    print('usage:')
    print('  ./g2pdb.py inputname.log / .com')
    print('options:')
    print('     -s scan_points  ("all" or int)  [default =  "all"]')
    print('     -o opt_points   ("all" or int)  [default = -1]')
    print('     -p outputname.pdb           [default = inputname + .pdb]')
    print('     -h                          write high layer only')
    print('     -P                          pymol alignment')

def pts_to_int(pts):
    try:
        pts = int(pts)
        return int(pts)
    except:
        if pts =='all':
            return pts
        else:
            usage()
            print('bad input:')
            print('  expected int or all, but got:', pts)
            sys.exit(2)

def write_pdb(gaulog, scan_pts, opt_pts, highlayeronly, outputname):

    # get the bytes
    chosen_bytes = []
    if scan_pts == 'all':
        for sbytes in gaulog.grep_bytes['orientation:']:
            if opt_pts == 'all':
                for byte in sbytes:
                    chosen_bytes.append(byte) # this is crazy
            else:
                chosen_bytes.append(sbytes[opt_pts])
    else:
        sbytes = gaulog.grep_bytes['orientation:'][scan_pts]
        if opt_pts == 'all':
            for byte in sbytes:
                chosen_bytes.append(byte) # this is reasonable 
        else:
            chosen_bytes.append(sbytes[opt_pts])

    # produce txt output
    txt = ''
    model_number = 0
    for byte in chosen_bytes:
        model_number += 1
        xyz = gaulog.read_coordinates('all', byte)
        counter = 0 
        txt += 'MODEL %d\n' % model_number
        for (coords, atom) in zip(xyz, gaulog.atoms_list):
            counter += 1 # consistent with gaussian line number
            if (not highlayeronly) or atom.oniom.layer == 'H':
                atom.set_coordinates(coords)
                atom.set_pdbinfo(atoms.PDBinfo('ATOM', counter))
                if atom.oniom:
                    atom.pdbinfo.altloc = atom.oniom.layer # layer-altloc hack
                txt += iolines.atom2pdb(atom)
        txt += 'ENDMDL\n'
    return txt

def main():
    
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], 's:o:p:hN')     
    except getopt.GetoptError as err:
        sys.stderr.write(err + '\n')
        usage()
        sys.exit(2)
    
    if len(args) < 1:
        usage()
        print('missing:')
        print('  inputname.com / .log')
        sys.exit(2)
    elif len(args) > 1:
        usage()
        print('too many args:')
        print('  %s' % (','.join(args)))
    
    filein = args[0]
    basename, input_extension = splitext(filein)
    if input_extension not in ['.log', '.com']:
        print('WARNING:')
        print('  inputname suffix is: %s' % input_extension)
    
    # defaults
    scan_pts = 'all'
    opt_pts = '-1'
    outputname = basename + '.pdb'
    highlayeronly = False
    pymol = False
    
    # provided input
    for o, a in opts:
        if o == '-s':   scan_pts = a
        elif o == '-o': opt_pts = a
        elif o == '-p': outputname = a 
        elif o == '-h': highlayeronly = True
        elif o == '-P': pymol = True

    # .com file ?
    if input_extension == ".com":
        gaucom = GAUCOM(filein)
        txt = ''
        for (i,at) in enumerate(gaucom.atoms_list):
            if (not highlayeronly) or at.oniom.layer == 'H':
                at.set_pdbinfo(atoms.PDBinfo('ATOM', i))
                if at.oniom:
                    at.pdbinfo.altloc = at.oniom.layer
                txt += iolines.atom2pdb(at)

        with open(outputname, 'w') as o:
            o.write(txt)
        
        return 0


    # log file only        
    
    scan_pts = pts_to_int(scan_pts)
    opt_pts  = pts_to_int(opt_pts)
    
    # MAGIC IS 4 LINES NOW
    gaulog = GAULOG(filein)
    txt = write_pdb(gaulog, scan_pts, opt_pts, highlayeronly, outputname)
    with open(outputname, 'w') as o:
        o.write(txt)

    if 'all' not in [scan_pts, opt_pts] or not pymol:
        print('Done.')
        return 0

    print ('Aligning with pymol...')
    
    # MORE MAGIC: Use pymol for alignment
    o = outputname
    b = splitext(o)[0]
    txt  = 'cmd.load("%s", format="pdb", multiplex=0)\n' % o
    txt += 'cmd.intra_fit("%s", state=0)\n' % b
    txt += 'cmd.save("%s", selection="%s", state=0, format="pdb")\n' % (o, b)
    txt += 'cmd.quit\n'
    with open('.temp_pymolscript.pml', "w") as temp_pymolscript:
        temp_pymolscript.write(txt)

    subprocess.call('pymol -qc .temp_pymolscript.pml', shell=True)
    subprocess.call('rm .temp_pymolscript.pml', shell=True)
    
    print('Done.')
    return 0

#yeah
main()



