#!/usr/bin/env python

import math
import numpy as np

def anymetric(TUPLIST):
    """TUPLIST can have 2,3 or 4 tuples of x,y,z values"""
    if len(TUPLIST) == 2:
        A,B = TUPLIST
        return distance(A,B)
    elif len(TUPLIST) == 3:
        A,B,C = TUPLIST
        return angle(B,A,C) # NOTE CONSISTENT WITH GAUSSIAN MODREDUNDANT
    elif len(TUPLIST) == 4:
        A,B,C,D = TUPLIST
        return dihedral(A,B,C,D)
    else:
        raise RuntimeError('len(TUPLIST) must be 2,3 or 4')

def difang(a, b):
    """min RADIANs difference either clock or counter-clock-wise"""
    alldifs = [abs(a-b+(i*math.pi)) for i in [-4, -2, 0, 2, 4]]
    return min(alldifs)

def rot3D(pt, ax, rad):
    """
Rotate point:
pt = (x,y,z) coordinates to be rotated
ax = vector around wich rotation is performed
rad = rotate by "rad" radians
"""
    # Make sure ax has unitary length
    len_ax = distance(ax, (0,0,0))
    u, v, w = [i/len_ax for i in ax]
    x, y, z = pt
    ux, uy, uz = u*x, u*y, u*z
    vx, vy, vz = v*x, v*y, v*z
    wx, wy, wz = w*x, w*y, w*z
    sa=math.sin(rad)
    ca=math.cos(rad)
    #pt[0]=(u*(ux+vy+wz)+(x*(v*v+w*w)-u*(vy+wz))*ca+(-wy+vz)*sa)+ m[0]
    #pt[1]=(v*(ux+vy+wz)+(y*(u*u+w*w)-v*(ux+wz))*ca+(wx-uz)*sa)+ m[1]
    #pt[2]=(w*(ux+vy+wz)+(z*(u*u+v*v)-w*(ux+vy))*ca+(-vx+uy)*sa)+ m[2]
    p0 =(u*(ux+vy+wz)+(x*(v*v+w*w)-u*(vy+wz))*ca+(-wy+vz)*sa)
    p1=(v*(ux+vy+wz)+(y*(u*u+w*w)-v*(ux+wz))*ca+(wx-uz)*sa)
    p2=(w*(ux+vy+wz)+(z*(u*u+v*v)-w*(ux+vy))*ca+(-vx+uy)*sa)
    #b = [pt, m, ax]
    return (p0, p1, p2)
