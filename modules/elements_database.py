#!/usr/bin/env python3

#data
ATOMIC_NUMBER_DICT = {'H':1, 'C':6, 'N':7, 'O':8, 'F':9,"Na":11, 'Mg':12, 'P':15, 'S':16, 'Cl':17,\
                       'Mn':25,'Co':27, 'Ni':28, 'Cu': 29,'Zn':30, 'Br':35, 'I':53}

ATOMIC_NUMBER_DICT_REVERSE = {1:'H', 6:'C', 7:'N', 8:'O', 9:'F', 12:'Mg', 15:'P', 16:'S', 17:'Cl', 25:'Mn', 27:'Co', 28:'Ni', 30:'Zn', 35:'Br', 53:'I'}

#typical bond length -simple =double *triple bond  .half
#from gaussview
#maybe it would be better to have these values in a database
BONDS_DISTANCES_PAIRS = {\
"H-H":0.74, "H-C":1.09, "H-N":1.00,"H-O":0.96, "H-F":0.92, "H-Mg":1.66, "H-P":1.35, "H-S":1.31, "H-Cl":1.29, "H-Mn":1.47, "H-Co":1.46, "H-Ni":1.45, "H-Zn":1.55, "H-Br":1.44, "H-I":1.63,

"C-C":1.54, "C-N":1.47, "C-O":1.43,"C-F":1.35,"C-Mg":2.13,"C-P":1.82, "C-S":1.78, "C-Cl":1.76,"C-Mn":1.94, "C-Co":1.93, "C-Ni":1.92,"C-Zn":2.05, "C-Br":1.91,"C-I":2.10,
"C-.O":1.36,

"N-N":1.40, "N-O":1.36, "N-F":1.28, "N-Mg":2.06, "N-P":1.75, "N-S":1.71, "N-Cl":1.69, "N-Mn":1.87, "N-Co":1.86, "N-Ni":1.95, "N-Zn":2.10, "N-Br":1.84, "N-I":2.03,

"O-O":1.32, "O-F":1.24, "O-Mg":2.02, "O-P":1.71, "O-S":1.67, "O-Cl":1.65, "O-Mn":1.83,"O-Co":1.82, "O-Ni":1.9, "O-Zn":2.10, "O-Br":1.80, "O-I":1.99,

"F-F":1.16, "F-Mg":1.94, "F-P":1.94, "F-S":1.59, "F-Cl":1.57, "F-Mn":1.75, "F-Co":1.74, "F-Ni":1.73, "F-Zn":1.83, "F-Br":1.72, "F-I":1.91,

"Mg-Mg":2.72, "Mg-P":2.41, "Mg-S":2.37, "Mg-Cl":2.35, "Mg-Mn":2.53, "Mg-Co":2.52, "Mg-Ni":2.51, "Mg-Zn":2.61, "Mg-Br":2.50, "Mg-I":2.69,

"P-P":2.10, "P-S":2.06, "P-Cl":2.04, "P-Mn":2.22, "P-Co":2.41, "P-Ni":2.20, "P-Zn":2.30, "P-Br":2.19, "P-I":2.38,

"S-S":2.02, "S-Cl":2.00, "S-Mn":2.18, "S-Co":2.17, "S-Ni":2.16, "S-Zn":2.26, "S-Br":2.15, "S-I":2.34,

"Cl-Cl":1.98, "Cl-Mn":2.16, "Cl-Co":2.15, "Cl-Ni":2.14, "Cl-Zn":2.24, "S-Br":2.13, "S-I":2.32,

"Mn-Mn":2.34,"Mn-Co":2.33, "Mn-Ni":2.32, "Mn-Zn":2.42, "Mn-Br":2.31, "Mn-I":2.50,

"Co-Co":2.32, "Co-Ni":2.31, "Co-Zn":2.41, "Co-Br":2.3, "Co-I":2.49,

"Ni-Ni":2.30, "Ni-Zn":2.40, "Ni-Br":2.29, "Ni-I":2.48,

"Zn-Zn":2.50, "Zn-Br":2.39, "Zn-I":2.58,

"Br-Br":2.28, "Br-I":2.47,

"I-I":2.66

}
