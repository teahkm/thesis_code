import numpy as np
import matplotlib.pyplot as plt
import scipy.io as spio
import seaborn as sns
import pandas as pd

mat = spio.loadmat("pareto_data.mat", squeeze_me=True)

x_norm = mat["x_norm"]
r_norm = mat["r_norm"]

sns.set_theme(context="paper", style="white", font="serif")

df = pd.DataFrame({"x": x_norm, "y": r_norm})
g = sns.relplot(x="x", y="y", kind="line", data=df)
g.set_axis_labels("one-norm of the solution", "two-norm of the residual")
plt.plot([min(df["x"]), max(df["x"])], [0.3, 0.3], color="orange", linestyle="dashed")
#g.savefig("output2.pdf")
plt.show()
