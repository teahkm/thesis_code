import numpy as np
import matplotlib.pyplot as plt
import scipy.io as spio
import seaborn as sns
import pandas as pd
from matplotlib.colors import Normalize

"""
mat_had = spio.loadmat("H_ord.mat", squeeze_me=True)
H_ord = mat_had["H_ord"]
plt.imshow(H_ord, interpolation='nearest', norm=Normalize(), cmap='Greys')
ax = plt.gca()
plt.tick_params(left=False, bottom=False)
ax.set(xticklabels=[])
ax.set(yticklabels=[])
plt.savefig('H_ord.pdf')

mat_had = spio.loadmat("H_seq.mat", squeeze_me=True)
H_seq = mat_had["H_seq"]
plt.imshow(H_seq, interpolation='nearest', norm=Normalize(), cmap='Greys')
ax = plt.gca()
plt.tick_params(left=False, bottom=False)
ax.set(xticklabels=[])
ax.set(yticklabels=[])
plt.savefig('H_seq.pdf')
"""
mat_had = spio.loadmat("H_pal.mat", squeeze_me=True)
H_pal = mat_had["H_pal"]
plt.imshow(H_pal, interpolation='nearest', norm=Normalize(), cmap='Greys')
ax = plt.gca()
plt.tick_params(left=False, bottom=False)
ax.set(xticklabels=[])
ax.set(yticklabels=[])
plt.savefig('H_pal.pdf')
