import os
import loompy

root = "/projects/nehard/SingleCell/Jupyter/Velocity/"
files = [os.path.join(root, x) for x in ["./loom_files/JB18025_HI13.loom", "./loom_files/JB18031_HY5.loom", "./loom_files/JB18085_HC10.loom", './loom_files/JB18036_HO4.loom']]
loompy.combine(files, "Comb.loom")
