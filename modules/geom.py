#!/usr/bin/env python3

import math
import numpy as np

def square_diff(A,B):
    "a and b are n-dimensional vectors"
    return sum([(a-b)**2 for a,b in zip(A,B)])

def distance(A,B):
    "a and b are n-dimensional vectors"
    return math.sqrt(square_diff(A,B))

def angle(A,B,C):
    "3D space, A in CENTER"
    d12 = distance(A,B)
    d13 = distance(A,C)
    d23 = distance(B,C)
    #round. To avoid things like 1.000000001
    return math.acos(round((d12**2 + d13**2 - d23**2)/(2*d12*d13), 7))

def dihedral(A,B,C,D):
    """Calculate dihedral considering A in the beggining"""
    A, B, C, D = [np.array(x) for x in (A,B,C,D)]
    b1 = B - A
    b2 = C - B
    b3 = D - C
    temp = np.linalg.norm(b2) * b1
    y = np.dot(temp, np.cross(b2, b3))
    x = np.dot(np.cross(b1, b2), np.cross(b2, b3))
    return np.degrees(math.atan2(y, x))

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
