#!/bin/python3

import re
import os
import shutil

# Get all the files in the folder
allfiles = os.listdir()

# Select only .Rmd-files, which aren't named index and _main
files = []
for f in allfiles:
    if f.endswith(".Rmd") and f != "index.Rmd" and f != "_main.Rmd":
        files.append(f)

# Read how the tags should be replaced
# (This doesn't have to be hardcoded, but because there is only one use
# case we will do it this way)
with open("tools/author.start.html") as f:
    replace_start_html = f.read()
with open("tools/author.end.html") as f:
    replace_end_html = f.read()
with open("tools/author.start.tex") as f:
    replace_start_tex = f.read()
with open("tools/author.end.tex") as f:
    replace_end_tex = f.read()

# Construct the replacement pattern
replace = (replace_start_html + r"\1" + replace_end_html +
          "\n" + replace_start_tex + r"\1" + replace_end_tex)

# Read each file, find the section to replace, and replace it
# But before doing that, move the files to a temporary folder
pattern = r"<!--author.start-->(.*)<!--author.end-->"
for f in files:
    shutil.copy(f, "tmp")
    file = open(f, "r")
    old = file.read()
    new = re.sub(pattern, replace, old, flags=re.DOTALL)
    file.close()
    if (new != old):
        file = open(f, "w")
        file.write(new)
        file.close()

