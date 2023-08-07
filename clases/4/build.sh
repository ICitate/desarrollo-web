#!/bin/bash
pandoc -V toc-title:"Indice de contenidos" \
    -s \
    --no-highlight \
    --template ../template.html \
    --toc \
    index.md -o index.html 
