import os
import loompy

root = "/projects/nehard/SingleCell/Jupyter/Velocity/"
files = [os.path.join(root, x) for x in ["./your_path/object1.loom", "./your_path/object2.loom", "/your_path/object3.loom"]]
loompy.combine(files, "Comb.loom")
