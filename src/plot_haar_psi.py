import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd

def haar_psi(t):
    """ Phi function for the Haar wavelet. """

    if t>=0 and t<0.5:
        return 1
    elif t>= 0.5 and t<1:
        return -1
    return 0

sns.set_theme(context="paper", style="white", font="serif")

t = np.linspace(-0.5,1.5,100)
y = np.zeros(100)

for i in range(100):
    y[i] = haar_psi(t[i])

# plotting
df = pd.DataFrame({"x": t, "y": y})
g = sns.relplot(x="x", y="y", kind="line", data=df)
g.set_axis_labels("","")
plt.ylim([-1.5,1.5])
plt.savefig("psi_plot.pdf",dpi=400)
plt.show()
