#!/usr/bin/env python2.7

import iolines
import atoms
import sys

xyz_line = ' C                 -1.204835   -0.318662    0.000000'
oniom_line1 = ' C           0   -1.6365  0.0005  0.9031 L'
oniom_line2 = ' C           0   -1.6365  0.0005  0.9031 L H       123'
oniom_line3 = ' C           0   -1.6365  0.0005  0.9031 L H-HC    123'
oniom_line4 = ' C-C3        0   -1.6365  0.0005  0.9031 L H-HC    123'
oniom_line5 = ' C-C3--.1    0   -1.6365  0.0005  0.9031 L H-HC    123'
oniom_line6 = ' C-C3--.1    0   -1.6365  0.0005  0.9031 L H-HC    123 0.9'
oniom_line7 = ' C-C3--.1    0   -1.6365  0.0005  0.9031 L H-HC-.4 123 0.9'
oniom_line8 = ' C-C2-0.0569770(PDBName=C7,ResName=FPP,ResNum=336_)          -1     -2.489649      1.976316     -0.712795  L H-HX 5455'
xyzpdb_line = ' H(PDBName=CA,ResName=HIS,ResNum=235_A)          0    0.110000    0.896000    7.313000 L'
mm_line = ' O-O2  -1.23 2.34 -3.45'

# oniom values
expected_xyz = (-1.6365, 0.0005, 0.9031)
link_element = 'H'
link_atype = 'HC'
link_charge = 0.4
link_bound_to = 123
link_scale1 = .9
element = 'C'
atype = 'C3'
charge = -.1

# mm values
mm_element = 'O'
mm_atype = 'O2'
mm_charge = .0 # defaulting
mm_xyz = (-1.23, 2.34, -3.45)

# xyz values
xyz_xyz = (-1.204835, -0.318662, 0.0)
xyz_el = 'C'
xyz_atomic_nr = 6

def zmat2atom_xyz_read(line):
    atom = iolines.zmat2atom(line)
    T1 = atom.element == xyz_el
    T2 = atom.atomic_nr == xyz_atomic_nr
    T3 = atom.get_coordinates() == xyz_xyz
    if not T1:
        sys.stderr.write('zmat2atom xyz - failed element\n')
    if not T2:
        sys.stderr.write('zmat2atom xyz - failed atomic_nr\n')
    if not T3.all():
        sys.stderr.write('zmat2atom xyz - failed coordinates\n')
    if T1 and T2 and T3.all():
        return (True, atom)
    else:
        return (False, None)

# read xyz
(ok, xyz_1) = zmat2atom_xyz_read(xyz_line)
if ok:
    print ('OK: xyz (read)')
else:
    print ('FAIL: xyz (read)')

# write xyz
line_out = iolines.atom2zmat(xyz_1)
(ok, _) = zmat2atom_xyz_read(line_out)
if ok:
    print('OK: xyz (write)')
else:
    print('FAIL: xyz (write)')

#read oniom_line1
def check_oniom1(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == element):
        failed.append('element')
    if not (x.oniom.mask == 0):
        failed.append('mask')
    if not (x.get_coordinates() == expected_xyz).all():
        failed.append('coordinates')
        print (x.get_coordinates())
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line1 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line1 (%s)' % rw)
    
#read oniom_line2
def check_oniom2(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == element):
        failed.append('element')
    if not (x.oniom.mask == 0):
        failed.append('mask')
    if not (x.get_coordinates() == expected_xyz).all():
        failed.append('coordinates')
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if not (x.oniom.link_bound_to == 123):
        failed.append('link bound to')
    if not (x.oniom.link_atom.element == 'H'):
        failed.append('link element')
    if x.oniom.link_atom.mm:
        failed.append('link MM')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line2 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line2 (%s)' % rw)
    
#read oniom_line3
def check_oniom3(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == element):
        failed.append('element')
    if not (x.oniom.mask == 0):
        failed.append('mask')
    if not (x.get_coordinates() == expected_xyz).all():
        failed.append('coordinates')
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if not (x.oniom.link_bound_to == 123):
        failed.append('link bound to')
    if not (x.oniom.link_atom.element == 'H'):
        failed.append('link element')
    if not (x.oniom.link_atom.mm.atype == 'HC'):
        failed.append('link atype')
    if not (x.oniom.link_atom.mm.charge == 0.0):
        failed.append('link charge')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line3 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line3 (%s)' % rw)

#read oniom_line4
def check_oniom4(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == element):
        failed.append('element')
    if not (x.oniom.mask == 0):
        failed.append('mask')
    if not (x.get_coordinates() == expected_xyz).all():
        failed.append('coordinates')
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if not (x.oniom.link_bound_to == 123):
        failed.append('link bound to')
    if not (x.oniom.link_atom.element == 'H'):
        failed.append('link element')
    if not (x.oniom.link_atom.mm.atype == 'HC'):
        failed.append('link atype')
    if not (x.oniom.link_atom.mm.charge == 0.0):
        failed.append('link charge')
    if not (x.mm.charge == 0.0):
        failed.append('charge')
    if not (x.mm.atype == 'C3'):
        failed.append('atype')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line5 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line4 (%s)' % rw)

#read oniom_line5
def check_oniom5(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == element):
        failed.append('element')
    if not (x.oniom.mask == 0):
        failed.append('mask')
    if not (x.get_coordinates() == expected_xyz).all():
        failed.append('coordinates')
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if not (x.oniom.link_bound_to == 123):
        failed.append('link bound to')
    if not (x.oniom.link_atom.element == 'H'):
        failed.append('link element')
    if not (x.oniom.link_atom.mm.atype == 'HC'):
        failed.append('link atype')
    if not (x.oniom.link_atom.mm.charge == 0.0):
        failed.append('link charge')
    if not (x.mm.charge == -0.10):
        failed.append('charge')
    if not (x.mm.atype == 'C3'):
        failed.append('atype')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line5 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line5 (%s)' % rw)

#read oniom_line6
def check_oniom6(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == element):
        failed.append('element')
    if not (x.oniom.mask == 0):
        failed.append('mask')
    if not (x.get_coordinates() == expected_xyz).all():
        failed.append('coordinates')
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if not (x.oniom.link_bound_to == 123):
        failed.append('link bound to')
    if not (x.oniom.link_atom.element == 'H'):
        failed.append('link element')
    if not (x.oniom.link_atom.mm.atype == 'HC'):
        failed.append('link atype')
    if not (x.oniom.link_atom.mm.charge == 0.0):
        failed.append('link charge')
    if not (x.mm.charge == -0.10):
        failed.append('charge')
    if not (x.mm.atype == 'C3'):
        failed.append('atype')
    if not (x.oniom.link_scale1 == 0.9):
        failed.append('link scale1')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line6 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line6 (%s)' % rw)

#read oniom_line7
def check_oniom7(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == element):
        failed.append('element')
    if not (x.oniom.mask == 0):
        failed.append('mask')
    if not (x.get_coordinates() == expected_xyz).all():
        failed.append('coordinates')
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if not (x.oniom.link_bound_to == 123):
        failed.append('link bound to')
    if not (x.oniom.link_atom.element == 'H'):
        failed.append('link element')
    if not (x.oniom.link_atom.mm.atype == 'HC'):
        failed.append('link atype')
    if not (x.oniom.link_atom.mm.charge == 0.4):
        failed.append('link charge')
    if not (x.mm.charge == -0.10):
        failed.append('charge')
    if not (x.mm.atype == 'C3'):
        failed.append('atype')
    if not (x.oniom.link_scale1 == 0.9):
        failed.append('link scale1')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line7 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line7 (%s)' % rw)

#read oniom_line8
def check_oniom8(line, rw):
    x = iolines.zmat2atom(oniom_line8)
    failed = []
    if not (x.element == 'C'):
        failed.append('element')
    if not (x.oniom.mask == -1):
        failed.append('mask')
    if not (x.get_coordinates() == (-2.489649, 1.976316, -0.712795)).all():
        failed.append('coordinates')
    if not (x.oniom.layer == 'L'):
        failed.append('layer')
    if not (x.oniom.link_bound_to == 5455):
        failed.append('link bound to')
    if not (x.oniom.link_atom.element == 'H'):
        failed.append('link element')
    if not (x.oniom.link_atom.mm.atype == 'HX'):
        failed.append('link atype')
    if not (x.oniom.link_atom.mm.charge == 0):
        failed.append('link charge')
    if not (x.mm.charge == 0.0569770):
        failed.append('charge')
    if not (x.mm.atype == 'C2'):
        failed.append('atype')
    if not (x.oniom.link_scale1 == 0.):
        failed.append('link scale1')
    if not (x.resinfo.name == 'C7'):
        failed.append('resinfo_name')
    if not (x.resinfo.resname == 'FPP'):
        failed.append('resinfo_resname')
    if not (x.resinfo.resnum == 336):
        failed.append('resinfo_resnum')
    if not (x.resinfo.chain == ''):
        failed.append('resinfo_chain')
    if len(failed):
        sys.stderr.write('FAIL: oniom_line8 (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: oniom_line8 (%s)' % rw)

#read xyzpdb_line



# mm_line
def check_mm(line, rw):
    x = iolines.zmat2atom(line)
    failed = []
    if not (x.element == mm_element):
        failed.append('element')
    if not (x.get_coordinates() == mm_xyz).all():
        failed.append('coordinates')
    if not (x.mm.charge == 0.0):
        failed.append('charge')
    if not (x.mm.atype == 'O2'):
        failed.append('atype')
    if len(failed):
        sys.stderr.write('FAIL: mm_line (%s: %s)\n' % (rw, ','.join(failed)))
    else:
        print('OK: mm_line (%s)' % rw)


#1
check_oniom1(oniom_line1, 'read')
atom1 = iolines.zmat2atom(oniom_line1)
new_line1 = iolines.atom2zmat(atom1)
check_oniom1(new_line1, 'write')

# 2
check_oniom2(oniom_line2, 'read')
atom2 = iolines.zmat2atom(oniom_line2)
new_line2 = iolines.atom2zmat(atom2)
check_oniom2(new_line2, 'write')

# 3
check_oniom3(oniom_line3, 'read')
atom3 = iolines.zmat2atom(oniom_line3)
new_line3 = iolines.atom2zmat(atom3)
check_oniom3(new_line3, 'write')

# 4
check_oniom4(oniom_line4, 'read')
atom4 = iolines.zmat2atom(oniom_line4)
new_line4 = iolines.atom2zmat(atom4)
check_oniom4(new_line4, 'write')

# 5
check_oniom5(oniom_line5, 'read')
atom5 = iolines.zmat2atom(oniom_line5)
new_line5 = iolines.atom2zmat(atom5)
check_oniom5(new_line5, 'write')

# 6
check_oniom6(oniom_line6, 'read')
atom6 = iolines.zmat2atom(oniom_line6)
new_line6 = iolines.atom2zmat(atom6)
check_oniom6(new_line6, 'write')

# 7
check_oniom7(oniom_line7, 'read')
atom7 = iolines.zmat2atom(oniom_line7)
new_line7 = iolines.atom2zmat(atom7)
check_oniom7(new_line7, 'write')

# 8
check_oniom8(oniom_line8, 'read')
atom8 = iolines.zmat2atom(oniom_line8)
new_line8 = iolines.atom2zmat(atom8)
check_oniom8(new_line8, 'write')

#xyzpdb_line


# mm
check_mm(mm_line, 'read')
atom_mm = iolines.zmat2atom(mm_line)
new_line_mm = iolines.atom2zmat(atom_mm)
check_mm(new_line_mm, 'write')

# print pdb oniom8
atom8 = iolines.zmat2atom(oniom_line8)
p = atoms.PDBinfo('HETATM', 27)
atom8.set_pdbinfo(p)
print(iolines.atom2pdb(atom8))

