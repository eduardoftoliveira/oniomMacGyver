#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

import sys
import numpy as np

###user input###
lambdas = np.arange(0.05, 1, 0.05)

a = 'P1X'
b = 'NAD'

aMask= ':P1X'
bMask ='' 

aPrmtopFile = 'stable.prmtop'
aInpcrdFile = 'stable.inpcrd'

bPrmtopFile = 'solvent.prmtop'
bInpcrdFile = 'solvent.inpcrd'


#### Input de Minimização ####
def writeMin(name,NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA):
  minFile = \
  """Minimizacao
  &cntrl
    imin = 1,
    ntx = 1,
    maxcyc = 500,
    ntpr = 100,
    ntmin = %s,	
    ntf = 1,
    ntc = 1,
    ntb = 1,
    cut = 8.0,
    icfe= 1
    ifsc= %s
    crgmask = '%s'
    scmask= '%s'
    clambda = %s
   &end""" % (NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
  open('min' + name, 'w').write(minFile)
#### Input de Equilibração ###
def writeEqui(name,NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA):
  equiFile =\
  """Equilibracao
   &cntrl
    imin = 0,
    ntx = 1,
    irest = 0,
    ntpr = 2500,
    ntwr = 10000,
    ntwx = 0,
    ntmin = %s,
    ntf = 1,
    ntc = 1,
    ntb = 2,
    cut = 8.0,
    nstlim = 50000,
    dt = 0.001,
    temp0 = 300.0,
    ntt = 3,
    gamma_ln = 5,
    ntp = 1,
    pres0 = 1.0,
    taup = 0.2,
    icfe=1
    ifsc= %s
    crgmask = '%s'
    scmask='%s'
    clambda= %s
  &end""" % (NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
  open('equi' + name, 'w').write(equiFile)

#### Input de Produção  ######
def writeProd(name,NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA):
  prodFile = \
  """Producao
  &cntrl
    imin = 0,
    ntx = 5,
    irest = 1,
    ntpr = 10000,
    ntwr = 100000,
    ntwx = 10000,
    ntmin = %s,
    ntf = 1,
    ntc = 1,
    ntb = 2,
    cut = 8.0,
    nstlim = 1000000,
    dt = 0.001,
    temp0 = 300.0,
    ntt = 3,
    gamma_ln = 2,
    ntp = 1,
    pres0 = 1.0,
    taup = 2.0,
    icfe=1
    ifsc = %s
    crgmask='%s'
    scmask='%s'
    clambda= %s
  &end""" % (NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
  open('prod' + name, 'w').write(prodFile)
#####      Group File   #####
def writeGroup(passo,value,aPrmtopFile,aInpcrdFile,bPrmtopFile,bInpcrdFile):
  
   if passo == '1':
      ViRstFile = aInpcrdFile
      VfRstFile = aInpcrdFile
   elif passo == '2':
      ViRstFile = aInpcrdFile
      VfRstFile = bInpcrdFile    
    
  if passo == '1':  #prmtop 
    ViPrmtopFile = aPrmtopFile
    VfPrmtopFile = aPrmtopFile
  elif passo == '2':
    ViPrmtopFile = aPrmtopFile
    VfPrmtopFile = bPrmtopFile      
    

  groupMin = \
  """-O -i min-%s-%s-Vi.in -o min-%s-%s-Vi.out -p %s -c %s -r min-%s-%s-Vi.rst
-O -i min-%s-%s-Vf.in -o min-%s-%s-Vf.out -p %s -c %s -r min-%s-%s-Vf.rst""" \
  %(passo,value,passo,value,ViPrmtopFile,ViRstFile,passo,value,\
  passo,value,passo,value,VfPrmtopFile,VfRstFile,passo,value)
  
  open('min-%s-%s.groupfile' %(passo,value), 'w').write(groupMin)
  
  groupEqui = \
  """-O -i equi-%s-%s-Vi.in -o equi-%s-%s-Vi.out -p %s -c min-%s-%s-Vi.rst -r equi-%s-%s-Vi.rst
-O -i equi-%s-%s-Vf.in -o equi-%s-%s-Vf.out -p %s -c min-%s-%s-Vf.rst -r equi-%s-%s-Vf.rst""" \
  %(passo,value,passo,value,ViPrmtopFile,passo,value,passo,value,\
  passo,value,passo,value,VfPrmtopFile,passo,value,passo,value)
  
  open('equi-%s-%s.groupfile' %(passo,value), 'w').write(groupEqui)
  
  groupProd = \
  """-O -i prod-%s-%s-Vi.in -o prod-%s-%s-Vi.out -p %s -c equi-%s-%s-Vi.rst -r prod-%s-%s-Vi.rst
-O -i prod-%s-%s-Vf.in -o prod-%s-%s-Vf.out -p %s -c equi-%s-%s-Vf.rst -r prod-%s-%s-Vf.rst"""\
  %(passo,value,passo,value,ViPrmtopFile,passo,value,passo,value,\
  passo,value,passo,value,VfPrmtopFile,passo,value,passo,value)
  
  open('prod-%s-%s.groupfile' %(passo,value), 'w').write(groupProd)

for passo in ['1','2']:
  if passo == '1':
    scmask_Vi = ''
    crgmask_Vi = ''
    scmask_Vf = ''
    crgmask_Vf = aMask
    ifsc = '0'
    ntmin = '1'
  elif passo == '2':
    scmask_Vi = aMask
    crgmask_Vi = aMask
    scmask_Vf = bMask
    crgmask_Vf = bMask
    ifsc = '1'
    ntmin = '2'

  for value in lambdas:
    CLAMBDA = value
    IFSC    = ifsc
    CRGMASK = crgmask_Vi
    SCMASK  = scmask_Vi
    NTMIN = ntmin
    name = '-%s-%s-Vi.in' % (passo,value)
    writeMin(name,NTMIN, IFSC,CRGMASK,SCMASK,CLAMBDA)
    writeEqui(name,NTMIN, IFSC,CRGMASK,SCMASK,CLAMBDA)
    writeProd(name,NTMIN, IFSC,CRGMASK,SCMASK,CLAMBDA)

    IFSC    = ifsc
    CRGMASK = crgmask_Vf
    SCMASK  = scmask_Vf
    name = '-%s-%s-Vf.in' % (passo,value)
    writeMin(name, NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
    writeEqui(name, NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
    writeProd(name, NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
    
    writeGroup(passo, value,aPrmtopFile,aInpcrdFile,bPrmtopFile,bInpcrdFile)
