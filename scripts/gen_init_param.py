#!/usr/bin/python

from sys import argv

f = open(argv[1])

while True:
    line = f.readline()
    if 'Initial Parameters' in line:
        break


for i in range(4):
    line = f.readline()

while True:
    line = f.readline()
    if '-------------------' in line:
        break
    Definition = line[9:30]
    Definition = Definition.split('(')[1].split(')')[0]
    words = Definition.split(',')
    if len(words) == 2:
        print "B {0[0]} {0[1]}".format(words)    
    elif len(words) == 3:
        print "A {0[0]} {0[1]} {0[2]}".format(words)
    else:
        print "D {0[0]} {0[1]} {0[2]} {0[3]}".format(words) 
