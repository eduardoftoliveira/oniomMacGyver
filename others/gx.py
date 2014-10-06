#!/usr/bin/env python3

from gaussian import GaussianLog as G
import sys

def usage():
    print('usage:')
    print(' ./gx.py gau.log scan_step(1-indexed) > xyz')

def main():
    try:
        gaussianLog_filename = sys.argv[1]
        scan_step = int(sys.argv[2])
    except:
        usage()
        sys.exit(2)
    
    x = G(gaussianLog_filename)

    byte = x.bytedict['orientation:'][scan_step-1][-1]
    xyz = x.read_coordinates('*', byte)
    txt = ''.join(['%12.6f%12.6f%12.6f\n' % xyz for xyz in xyz])
    print(txt[:-1])

main()

