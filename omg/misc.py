from math import sqrt
import numpy as np
import decimal
import numpy as np
import subprocess
import os

def transpose_list_of_lists(mat):
    """
        input:  list of X lists with Y items
        output: list of Y lists with X items
    """
    X = len(mat)
    Ys = [len(row) for row in mat]
    if len(set(Ys)) != 1:
        raise RuntimeError('needed matrix, got lists of varying length')
    Y = Ys[0]
    outmat = []
    for j in range(Y):
        newrow = []
        for i in range(X):
            newrow.append(mat[i][j])
        outmat.append(newrow)
    return outmat

def starfloat(text):
    try:
        out = float(text)
        return out
    except:
        if text.strip().startswith('*'):
            return float('+inf')
        else:
            raise RuntimeError('needed float or *, got %s' % text)

def avg(vec):
    return float(sum(vec))/len(vec)

def std(vec):
    a = avg(vec)
    return np.sqrt(sum([(x-a)**2 for x in vec])/len(vec))

    

T = decimal.Decimal(310.15)
KB = decimal.Decimal(1.3806488E-23)
R = decimal.Decimal(8.31446211)
HKCAL = decimal.Decimal(627.5095)
HJOULE = decimal.Decimal(4.3597482E-18)
JKCAL = decimal.Decimal(0.000239005736)
NA = decimal.Decimal(6.0221413e+23)
decimal.getcontext().Emax = 999999999999999999
decimal.getcontext().Emin = -999999999999999999



def exponential_average(arr):
    """Returns the exponential average of an array. Uses SI units but kcal 
    instead of Joules"""
    
    log_sum = 0
    for log_v in arr:
        log_v = decimal.Decimal(log_v)
        log_v = (log_v/JKCAL)/NA
        log_v = np.exp(-log_v/(T*KB))
        log_sum += log_v

    exp_average = log_sum/len(arr)
    delta_g = exp_average.ln() * -KB*T*NA*JKCAL
    
    return delta_g


def grep2list(pattern, filename, position, vtype=float, np_array=False):
    """Returns a list or array with the value extracted for a position in the 
       grepped lines of a file"""

    command = "grep '{0}'  {1}".format(pattern, filename)
    call = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
    output = call.stdout.read()
    values = [vtype(v.split()[position]) for v in output.strip().split("\n")]
    if np_array:
        values = np.array(values)
    return values


def PCA(A): # principal component analysis
 """ performs principal components analysis 
     (PCA) on the n-by-p data matrix A
     Rows of A correspond to observations, columns to variables. 

 Returns :  
  coeff :
    is a p-by-p matrix, each column containing coefficients 
    for one principal component.
  score : 
    the principal component scores; that is, the representation 
    of A in the principal component space. Rows of SCORE 
    correspond to observations, columns to components.
  latent : 
    a vector containing the eigenvalues 
    of the covariance matrix of A.
 """
 # computing eigenvalues and eigenvectors of covariance matrix
 M = (A-np.mean(A.T,axis=1)).T # subtract the mean (along columns)
 [latent,coeff] = np.linalg.eig(np.cov(M)) # attention:not always sorted
 score = np.dot(coeff.T,M) # projection of the data in the new space
 return coeff,score,latent

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


def increment_filename(filename):
    """It adds a _1, or increases the number in the filename situated before 
    the extension and after an underscore '_'.

    Example:
        nha_nhe_23.com --> nha_nhe_24.com
        nha.in         --> nha_1.in     
    """

    name, extension = os.path.splitext(filename)
    try:
        prefix, number = name.rsplit('_', 1)
        number = int(number)+1
    except ValueError:
        prefix = name
        number = 1
    
    return "{0}_{1}{2}".format(prefix, number, extension)






