#!/bin/zsh

cat bib/*.bib > pubs.bib
pandoc pubs.tex --from=latex --to=html  --citeproc --bibliography=pubs.bib \
    --output=pubs_body.html --csl=pubs.csl

./ref_par.py pubs_body.html > pubs_body2.html
cat head.html pubs_body2.html foot.html > ../pubs.html

## convert ris 2 bib
## ris2xml <risfile.ris> | xml2bib > <output.bib>
## 