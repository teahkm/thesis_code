import numpy as np
import matplotlib.pyplot as plt
import scipy.io as spio
import seaborn as sns
import pandas as pd

# load matlab data, data must be in same directory
mat_haar = spio.loadmat("coh_db1_dyadic.mat", squeeze_me=True)
mat_db4 = spio.loadmat("coh_db4_dyadic.mat", squeeze_me=True)

im_haar = mat_haar["im"]
im_db4 = mat_db4["im3"]

# to plot haar, remove comments around this and comment out db4 block
"""
# plot haar
ax = sns.heatmap(im_haar)
ax.set(xticklabels=[])
ax.set(yticklabels=[])
ax.tick_params(left=False, bottom=False)  # remove the ticks
plt.savefig('coherence_haar_dyadic.png')
plt.show()
"""

# plot db4
ax2 = sns.heatmap(im_db4)
ax2.set(xticklabels=[])
ax2.set(yticklabels=[])
ax2.tick_params(left=False, bottom=False)  # remove the ticks
plt.savefig('coherence_db4_dyadic.png')
plt.show()
