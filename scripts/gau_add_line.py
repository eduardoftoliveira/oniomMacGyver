#!/usr/bin/env python
"""Adds a line to gaussian log files to avoid an error in gaussview"""

import sys

with open(sys.argv[1], 'r+') as input_file:
    for a in range(1000000):
        input_file.seek(a)
        if input_file.read(7) == " I=    ":
            break

    input_file.seek(input_file.tell()-7)
    input_file.write("\n I=  ")
    input_file.flush()

