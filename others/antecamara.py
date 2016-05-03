#!/usr/bin/env python3

# What to import?
import sys
import getopt
from os.path import splitext, exists

def warn_overwrite(name_list):
    to_warn = []
    for name in name_list:
        if exists(name):
            to_warn.append('   ** ' + name)
    if len(to_warn) == 0:
        return False
    else:
        msg = 'WARNING, these files will be OVERWRITTEN:\n'
        msg += '\n'.join(to_warn) + '\n'
        return msg

def usage():
    print('usage:')
    print('    python AnteCamara.py your_molecule.mol2')
    print('      --resname      XXX')
    print('options:')
    print('      --gaulog       gaussian_out.log   | if gaussian has been run')
    print('      --model        resp* / bcc        | charge model')
    print('      --atype        gaff* / gaff       | atom types')
    print('                     * = default')

try:
    opts, args = getopt.gnu_getopt(sys.argv[1:], '', [
        'resname=', 'gaulog=', 'atype=', 'model=', 'messages'])

except getopt.GetoptError as err:
    sys.stderr.write(str(err)) # will print something like "option -a not recognized"
    usage()
    sys.exit(2) 

if len(args) != 1:
    usage()
    sys.stderr.write('ERROR:\n    missing input file\n')
    sys.exit(2)

# defaults
gaulog = None
messages = False
atype = 'gaff'
model = 'resp'

for o, a in opts:
        if o == '--resname':    resname = a
        if o == '--gaulog': gaulog = a
        if o == '--messages':   messages = True
        if o == '--atype':  atype = a
        if o == '--model':  model = a

needed_args = ['resname']
locals_now = locals()
missed_args = [aa for aa in needed_args if aa not in locals_now]
missing_msg = ', '.join(missed_args)

if len(missed_args) > 0: 
    usage()
    sys.stderr.write(
        'ERROR:\n    missing args:   %s\n' % (missing_msg))
    sys.exit(2)

if len(resname) != 3:
    usage()
    sys.stderr.write('ERROR:\n    --resname must be 3 char\n')
    sys.exit(2)

if atype not in ['amber', 'gaff']:
    usage()
    sys.stderr.write('ERROR:\n    --charge must be "gaff" or "amber"\n')
    sys.exit(2)

if model not in ['resp', 'bcc']:
    usage()
    sys.stderr.write('ERROR:\n    --model must be "resp" or "bcc"\n')
    sys.exit(2)

if gaulog and model == 'bcc':
    sys.stderr.write('ERROR:\n    --model "bcc" needs no QM calculations\n')
    sys.exit(2)

input_mol2 = args[0]
name = splitext(input_mol2)[0]

Gi = name + '.com'
Go = name + '.log'
if gaulog:
    Go = gaulog
F1 = name + '_%s_%s.prepi' % (model, atype)
F2 = name + '_%s.ac' % (model) 
F3 = name + '.crg'
F4 = name + '_sybyl_%s.ac' % ( model)
F5 = name + '_sybyl_%s_%s.ac' % (model, atype) 
F6 = resname + '.prepc'
F7 = resname + '.frcmod'


# sys.stderr.write(The following files will be overwritten:
newfiles = [F1, F2, F3, F4, F5, F6, F7]
if not gaulog:
    newfiles = [Gi, Go] + newfiles
msg = warn_overwrite(newfiles)
if msg:
    sys.stderr.write(msg)

commands = []
helps = []

#### You can run this on your shell. Or not. Up to you.

if not gaulog and model=='resp':
    cmd = 'antechamber -fi mol2 -fo gcrt  '
    cmd +=             '-i %s -o %s' % (input_mol2, Gi)
    commands.append(cmd)
    commands.append('g09 %s %s' % (Gi, Go))

if model == 'resp':
    cmd = 'antechamber -fi gout -fo prepi '
    cmd += '-i %s -o %s ' % (Go, F1)
elif model =='bcc':
    cmd = 'antechamber -fi mol2 -fo prepi '
    cmd += '-i %s -o %s ' % (input_mol2, F1)
cmd += '-c %s -j both -at %s -rn %s' % (model, atype, resname)
commands.append(cmd)

cmd = 'antechamber -fi gout -fo ac '
cmd +=          '   -i %s -o %s '% (Go, F2)
cmd += '        -c %s' % ( model) 
commands.append(cmd)

commands.append("antechamber -fi ac   -i %s -c wc -cf %s"  % (F2, F3))
commands.append("antechamber -fi mol2 -i %s    -c rc -cf %s -fo ac -o %s" % (input_mol2, F3, F4))
commands.append("atomtype -i %s       -o %s -p %s" % (F4, F5, atype))
commands.append("prepgen  -i %s -o %s  -f car -rn %s" % (F5, F6, resname))
commands.append("parmchk2  -i %s -o %s -f ac" % (F5, F7))
commands.append('#leap commands')
commands.append('#source leaprc.gaff')
commands.append('#source leaprc.ff99SB')
commands.append('#loadamberprep %s' % F6)
commands.append('#loadamberparams %s' % F7)
print('\n'.join(commands))

#

