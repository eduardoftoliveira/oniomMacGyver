#!/usr/bin/env python


import sys


with open(sys.argv[1], 'r+') as input_file:
    for a in range(1000000):
        #print input_file.read(10)
        input_file.seek(a)
        if input_file.read(7) == " I=    ":
            break

    input_file.seek(input_file.tell()-7)   
    input_file.write("\n I=  ")
    input_file.flush()

