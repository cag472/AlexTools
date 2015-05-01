#!/bin/bash

if [ "$1" == "-h" -o "$1" == "--help" ]; then
  echo " " 
  echo "Usage: mergePDF outputName inputName.pdf inputName2.pdf ..."
  echo "  inputs should be in the order you want them merged."
  echo "  outputName can have the .pdf extension or not."  
  echo " " 
  exit
fi


TEMP=(`echo $1 | tr '.' ' '`)
RAW=${TEMP[0]} 

gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -sOutputFile=$RAW.pdf  ${*:2} 
