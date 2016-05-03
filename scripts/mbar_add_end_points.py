#!/usr/bin/env python

import numpy as np
import sys
import matplotlib.pyplot as plt


with open(sys.argv[1], 'r') as mbar_file:
    for _ in range(3):
        mbar_file.next()
    mbar_values = []
    for line in mbar_file:
        if line.startswith("----"):
            break
        else:
            mbar_values.append(line.split()[3])

arr_mbar = np.array([0] + mbar_values +[0],dtype=float)
arr_mbar[0] = arr_mbar[1] - (arr_mbar[2] - arr_mbar[1])
arr_mbar[-1] = arr_mbar[-2] + (arr_mbar[-2] - arr_mbar[-3])
mbar_total = sum(arr_mbar)
print(mbar_total)

plt.plot(arr_mbar)
plt.show()




