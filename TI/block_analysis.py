#!/usr/bin/python

import subprocess
import numpy as np
import math
import matplotlib.pyplot as plt
import time

#user input
number_of_steps = 1000000
lambda_values = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9]
###

dvdl_values = []
stdev_values = []
blocks_list = []
for n in range(40, 20001):
    if float(number_of_steps)%n == 0:
        blocks_list.append(number_of_steps/n)

#extract dv/dl values with grep (much faster than python)
Sverd_list = []
for lambda_v in lambda_values:
    amber_output_file = "prod-x-{0}-Vf.out".format(lambda_v)
    print("Reading {0}".format(amber_output_file))
    grep_command = "grep 'DV/DL  =' prod*{0}-Vf.out".format(lambda_v)
    grep_call = subprocess.Popen(grep_command, shell=True, stdout=subprocess.PIPE)
    grep_output = grep_call.stdout.read()
    dvdl_list = grep_output.replace("DV/DL  =","").split("\n")
    dvdl_list = [float(no) for no in dvdl_list[:-4]]
    print("{0} dv/dl values read for lambda {1}"\
           .format(len(dvdl_list), lambda_v))

    dvdl_array = np.array(dvdl_list)
    total_average = np.average(dvdl_array)
    dvdl_values.append(total_average)
    total_stdev = np.std(dvdl_array)
    stdev_values.append(total_stdev)
    total_stdev_corr = total_stdev/math.sqrt(len(dvdl_list))
    print("For everything      ; average = {0}; stdev = {1}; stdev/sqrt(n); {2}"\
    .format(total_average,total_stdev, total_stdev_corr))
    block_stdev_corr_list = []
    for block_size in blocks_list:
        average_list=[]
        for start in range(0,len(dvdl_array),block_size):
            mini_array = dvdl_array[start:start+block_size]
            average_list.append(np.average(mini_array))
        block_average = np.average(average_list)
        block_stdev = np.std(average_list)
        block_stdev_corr = block_stdev/math.sqrt(len(dvdl_list)/block_size)
        block_stdev_corr_list.append(block_stdev_corr)
        print("For blocks of {0:6d}; average = {1}; stdev = {2}; stdev/sqrt(n); {3}"\
               .format(block_size, block_average,block_stdev, block_stdev_corr))
    
    y = block_stdev_corr_list
    x = blocks_list
    plt.plot(x,y)
    
    #fitting with gnuplot
    with open("to_fit",'w') as data_file:
        for i,block_size in enumerate(blocks_list):
            data_file.write("{0} {1}\n".format(block_size, block_stdev_corr_list[i]))
    with open("gnuplot.in",'w') as data_file:
        data_file.write("""f(x) = (-a/(x+b)) + c\n fit f(x) "to_fit" via a, b, c""")
    gp_command = "gnuplot gnuplot.in"
    gp_call = subprocess.Popen(gp_command, shell=True)
    time.sleep(1)
    with open("fit.log",'r') as log_file:
        for line in log_file:
            if "a               =" in line:
                a = float(line.split("=")[1].split("+")[0].strip())
            if "b               =" in line:
                b = float(line.split("=")[1].split("+")[0].strip())
            if "c               =" in line:
                c = float(line.split("=")[1].split("+")[0].strip())

    x_list = np.arange(0,blocks_list[0],10)
    y_list = []
    for x in x_list:
        y_list.append((-a/(x+b)) + c)
    plt.plot(x_list,y_list)
    print "Sverd = {0}".format(c)
    Sverd_list.append(c)
#    plt.legend(legend)
    plt.savefig("plot{0}.png".format(lambda_v), dpi=300)
    plt.clf()

#calculate Ncorr
n_corr_list =[]
for i, lambda_v in enumerate(lambda_values):
    n_corr = number_of_steps * (Sverd_list[i]/stdev_values[i])**2
    n_corr_list.append(n_corr)
    
#extrapolate data for lambda 0
if lambda_values[0] != 0:
    dvdl_mi = (dvdl_values[1] - dvdl_values[0])/(lambda_values[1]-lambda_values[0])
    dvdl_zero = dvdl_values[0] - dvdl_mi * lambda_values[0]
    lambda_values.insert(0,0)
    dvdl_values.insert(0, dvdl_zero)
    stdev_values.insert(0, stdev_values[0])

#extrapolate data for lambda 1
if lambda_values[-1] != 1:
    dvdl_mf = (dvdl_values[-1] - dvdl_values[-2])/(lambda_values[-1]-lambda_values[-2])
    dvdl_one = dvdl_values[-1] + dvdl_mf * (1 -lambda_values[-1])
    lambda_values.append(1)
    dvdl_values.append(dvdl_one)
    stdev_values.append(stdev_values[-1])

#integration
dvdl_integration = np.trapz(dvdl_values,x=lambda_values)
stdev_integration = np.trapz(stdev_values,x=lambda_values)


#add ends to block_stdev_corr_list and integrate the error
Sverd_list_all = Sverd_list[:]
Sverd_list_all.insert(0,Sverd_list_all[0])
Sverd_list_all.insert(-1,Sverd_list_all[-1])
sverd_corr_integration = np.trapz(Sverd_list_all,x=lambda_values)

#integration print
print "\nSummary:"
print "(values for lambda 0 and 1 are linear extrapolations)"
print "lambda     dvdl average  dvdl stdev average  dvdl stdev corrected"
for i, lambda_v in enumerate(lambda_values):
    print "{0:6.2f}{1:17f}{2:20f}{3:20f}"\
     .format(lambda_v, dvdl_values[i], stdev_values[i],Sverd_list_all[i])
    
print "Total DV/DL: {0}".format(dvdl_integration)
print "Amber error (stdev average): {0}".format(stdev_integration)
print "Corrected error (corrected stdev average): {0}".format(sverd_corr_integration)
plt.bar(lambda_values,dvdl_values)
plt.savefig("final.png".format(lambda_v), dpi=300)

print "n_corr average = {0}".format(np.average(n_corr_list))
