#!/bin/bash

if [ -z "$1" ]
  then
      echo "Ingrese el numero de clase (./build.sh <NUM_CLASE>)"
      exit 1
fi

pandoc -V toc-title:"Indice de contenidos" \
    -s \
    --no-highlight \
    --template template.html \
    --toc \
    --from markdown-native_divs \
    ./$1/index.md -o ./$1/index.html 
