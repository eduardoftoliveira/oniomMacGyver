import decimal
import numpy as np

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



