#!/bin/zsh

curl "https://raw.githubusercontent.com/ltalluto/lt-bibliography/refs/heads/main/pubs.bib?token=GHSAT0AAAAAADEWEYLZR2VYZMBP42AUQ5W62CH6WFQ" > pubs.bib

pandoc pubs.tex --from=latex --to=html  --wrap=preserve --citeproc \
    --bibliography=pubs.bib \
    --output=pubs_body.html --csl=pubs.csl

./ref_par.py pubs_body.html > pubs_body2.html
cat head.html pubs_body2.html foot.html > ../pubs.html

## convert ris 2 bib
## ris2xml <risfile.ris> | xml2bib > <output.bib>
## 