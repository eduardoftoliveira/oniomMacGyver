#!/usr/bin/env python3
""" This scripts allows the user to make FEP calculations along a 
reaction coordinate with the AMBER and GAUSSIAN software packages"""

# other modules
import argparse
import textwrap
import numpy as np
import decimal
import sys
from collections import OrderedDict
import matplotlib.pyplot as plt

# names
#RESULTS_FILE = sys.argv[1]

#CONSTANTS
T = decimal.Decimal(310.15)
KB = decimal.Decimal(1.3806488E-23)
R = decimal.Decimal(8.31446211)
HKCAL = decimal.Decimal(627.5095)
HJOULE = decimal.Decimal(4.3597482E-18)
JKCAL = decimal.Decimal(0.000239005736)
NA = decimal.Decimal(6.0221413e+23)

## others
FLT_CMP = 0.0001

def sp_to_energies(filename, position):
    """Returns a dict with lists of three arrays for previous, this and next point"""

    ###
    ###  results = [ window0.01. window0.02, window0.03, ...]
    ###  window0.01 = [array_previous, array_next, array_next]  
    ###
    with open(filename, 'r') as result_file:
        results = {}
        for line in result_file:
            words = line.split()
            this_one = words[0].split("/")[0]
            other_one = words[0].split("_")[-2]
            energy = decimal.Decimal(words[position])
            
            if this_one not in results:
                results[this_one] = [ [],
                                      [],
                                      [],
                                    ]
                    
            if (float(other_one) - float(this_one)) < -FLT_CMP:
                results[this_one][0].append(energy) # before
            elif -FLT_CMP < float(other_one) - float(this_one) < FLT_CMP:
                results[this_one][1].append(energy) # this
            else:
                results[this_one][2].append(energy) # after
            
    
    ## convert values list to numpy arrays
    for md_no in results:
        for lst_no in [0,1,2]:
            results[md_no][lst_no] = np.array(results[md_no][lst_no])
    
    return results

def calcEnergies(energy_ele, energy_real, energy_low, energy_model):
    """Reads the three required dicts and returns a list with the fep energy"""
    ### (high layer B - high layer A)
    forward_dict = {}
    backward_dict = {}
    for md_no in OrderedDict(sorted(energy_ele.items())):
        ## forward elec
        if (len(energy_ele[md_no][2]) == len((energy_ele[md_no][1]))):
            ele_energies = (energy_ele[md_no][2] - energy_ele[md_no][1])*HJOULE
            real_energies = (energy_real[md_no][2] - energy_real[md_no][1])*HJOULE
            low_energies = (energy_low[md_no][2] - energy_low[md_no][1])*HJOULE
            model_energies = (energy_model[md_no][2] - energy_model[md_no][1])*HJOULE
            vdw_energies = real_energies-low_energies#-model_energies
            #forward_energies = ele_energies+vdw_energies
            forward_energies = vdw_energies
            forward_energies = np.exp(-forward_energies/(T*KB)) # to log
            exp_avg = sum(forward_energies)/len(forward_energies)
            delta_g = exp_avg.ln() * -KB*T*NA*JKCAL
            print("f", md_no, delta_g)
            forward_dict[md_no] = delta_g
            plt.plot((energy_real[md_no][2]-energy_low[md_no][2]-energy_model[md_no][2])*decimal.Decimal(627.5095))
            plt.plot((energy_real[md_no][1]-energy_low[md_no][1]-energy_model[md_no][1])*decimal.Decimal(627.5095))
            #plt.plot(vdw_energies*NA/1000)
            #plt.plot(model_energies*NA/1000)
            #plt.plot(ele_energies*NA/1000)
            #plt.plot(vdw_energies*NA/1000+ele_energies*NA/1000)
            #plt.hlines(float(delta_g)*4.184,0 ,1)
            plt.show()
        
        ### backward
        if (len(energy_ele[md_no][1]) == len((energy_ele[md_no][0]))):
            ele_energies = (energy_ele[md_no][1] - energy_ele[md_no][0])*HJOULE
            real_energies = (energy_real[md_no][1] - energy_real[md_no][0])*HJOULE
            low_energies = (energy_low[md_no][1] - energy_low[md_no][0])*HJOULE
            model_energies = (energy_model[md_no][1] - energy_model[md_no][0])*HJOULE
            vdw_energies = tot_energies-mmm_energies-zer_energies
            #backward_energies = ele_energies+vdw_energies
            #backward_energies = ele_energies
            backward_energies = vdw_energies
            backward_energies = np.exp(-backward_energies/(T*KB)) # to log
            exp_avg = sum(backward_energies)/len(backward_energies)
            delta_g = exp_avg.ln() * -KB*T*NA*JKCAL
            #print("b", md_no, delta_g)
            backward_dict[md_no] = delta_g


    return forward_dict, backward_dict

def main():
    """ Just a wrapper"""
    energy_ele =  sp_to_energies('energies_ele',  9)
    energy_real =  sp_to_energies('energies_real',  2)
    energy_low =  sp_to_energies('energies_low', 2)
    energy_model = sp_to_energies('energies_model', 2)

    forward, backward =  calcEnergies(energy_ele, energy_real, 
                                      energy_low, energy_model) 

    
    x = [float(k) for k in forward.keys()]
    y = [float(v) for v in forward.values()]
    print(sum([float(v) for v in forward.values()]))
    print(len(x),len(y))
    #plt.plot(x, y,'ro')
   # plt.plot([float(k) for k in backward.keys()], backward.values())
    #plt.show()

    x = [float(k) for k in backward.keys()]
    y = [float(v) for v in backward.values()]
    print(sum([float(v) for v in backward.values()]))
    print(len(x),len(y))
    #plt.plot(x, y,'ro')
    # plt.plot([float(k) for k in backward.keys()], backward.values())
    #plt.show()

if __name__ == "__main__":
    main()
