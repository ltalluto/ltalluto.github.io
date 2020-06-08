#!/bin/zsh

cat bib/*.bib > pubs.bib
pandoc pubs.tex --from=latex --to=html  --filter=pandoc-citeproc --bibliography=pubs.bib \
    --output=pubs_body.html --csl=pubs.csl

cat head.html pubs.html foot.html > ../pubs.html

## convert ris 2 bib
## ris2xml <risfile.ris> | xml2bib > <output.bib>
## 