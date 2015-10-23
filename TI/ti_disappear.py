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


#### Input de MinimizaÃ§Ã£o ####
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
#### Input de EquilibraÃ§Ã£o ###
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

#### Input de ProduÃ§Ã£o  ######
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
def writeGroup(step,lvalue,aPrmtopFile,aInpcrdFile,bPrmtopFile,bInpcrdFile):
  
    if step == '1':
        ViRstFile = aInpcrdFile
        VfRstFile = aInpcrdFile
    elif step == '2':
        ViRstFile = aInpcrdFile
        VfRstFile = bInpcrdFile    
    
    if step == '1':  #prmtop 
        ViPrmtopFile = aPrmtopFile
        VfPrmtopFile = aPrmtopFile
    elif step == '2':
        ViPrmtopFile = aPrmtopFile
        VfPrmtopFile = bPrmtopFile      

    step_lambda_str = '_{0}_{1:.3f}'.format(step, lvalue)
  
    groupMin = """-O -i min{0}_Vi.in -o min{0}_Vi.out -p {1} -c {2} -r min{0}_Vi.rst\n"""\
               """-O -i min{0}_Vf.in -o min{0}_Vf.out -p {3} -c {4} -r min{0}_Vf.rst""".format(
           step_lambda_str, ViPrmtopFile, ViRstFile, VfPrmtopFile, VfRstFile)
    
    open('min{0}.groupfile'.format(step_lambda_str), 'w').write(groupMin)
  
    groupEqui = """-O -i equi{0}_Vi.in -o equi{0}_Vi.out -p {1} -c min{0}_Vi.rst -r equi{0}_Vi.rst\n"""\
                """-O -i equi{0}_Vf.in -o equi{0}_Vf.out -p {2} -c min{0}_Vf.rst -r equi{0}_Vf.rst""".format(
          step_lambda_str, ViPrmtopFile, VfPrmtopFile)
    
    open('equi{0}.groupfile'.format(step_lambda_str), 'w').write(groupEqui)
    
    groupProd = """-O -i prod{0}_Vi.in -o prod{0}_Vi.out -p {1} -c equi{0}_Vi.rst -r prod{0}_Vi.rst\n"""\
                """-O -i prod{0}_Vf.in -o prod{0}_Vf.out -p {2} -c equi{0}_Vf.rst -r prod{0}_Vf.rst""".format(
          step_lambda_str, ViPrmtopFile, VfPrmtopFile)
    
    open('prod{0}.groupfile' .format(step_lambda_str), 'w').write(groupProd)
  

for step in ['1','2']:
    if step == '1':
      scmask_Vi = ''
      crgmask_Vi = ''
      scmask_Vf = ''
      crgmask_Vf = aMask
      ifsc = '0'
      ntmin = '1'
    elif step == '2':
      scmask_Vi = aMask
      crgmask_Vi = aMask
      scmask_Vf = bMask
      crgmask_Vf = bMask
      ifsc = '1'
      ntmin = '2'
  
    for lvalue in lambdas:
      step_lambda_str = '_{0}_{1:.3f}'.format(step, lvalue)
      CLAMBDA = lvalue
      IFSC    = ifsc
      CRGMASK = crgmask_Vi
      SCMASK  = scmask_Vi
      NTMIN = ntmin
      name = '{0}_Vi.in'.format(step_lambda_str)
      writeMin(name,NTMIN, IFSC,CRGMASK,SCMASK,CLAMBDA)
      writeEqui(name,NTMIN, IFSC,CRGMASK,SCMASK,CLAMBDA)
      writeProd(name,NTMIN, IFSC,CRGMASK,SCMASK,CLAMBDA)
  
      IFSC    = ifsc
      CRGMASK = crgmask_Vf
      SCMASK  = scmask_Vf
      name = '{0}_Vf.in'.format(step_lambda_str)
      writeMin(name, NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
      writeEqui(name, NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
      writeProd(name, NTMIN,IFSC,CRGMASK,SCMASK,CLAMBDA)
      
      writeGroup(step, lvalue, aPrmtopFile,aInpcrdFile,bPrmtopFile,bInpcrdFile)
