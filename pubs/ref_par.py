#!/usr/bin/python3

import sys
import re

with open(sys.argv[1]) as f:
	lines = [line.rstrip() for line in f]

newl = list()
inref = False
for l in lines:
	if inref:
		m = re.match('</div>', l)
		if m is not None:
			newl.append("</p>")
			inref = False
		newl.append(l)
	else:
		newl.append(l)
		m = re.match('<div id="ref-.+" class="csl-entry"', l)
		if m is not None:
			inref = True
			newl.append("<p>")

for l in newl:
	print(l)
