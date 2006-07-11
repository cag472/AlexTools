#Alex Tools

These are the tools that mostly live in Alex's script directory.  Listed here in rough order of usefulness

###web
Transports things to the internet.
  - First argument "--ucsb" if you want this at hep.ucsb.edu, will otherwise post at uaf-7.t2.ucsd.edu (faster)
  - Following argument "-d BLAH" to have all these files placed in the BLAH directory
  - All subsequent arguments are the things you want to post

###pwdag 
  - pwdag BLAH will give an absolute path for BLAH.  

###.bashrc
  Special features:
  - If you type "vi" instead of "cd", it will do the right thing
  - If you try to "vi" a file that doesn't exist, it will complain (override with -n) rather than opening a blank file
  - If you cd to a directory and spell it wrong, it will fix it
  - Suppresses latex bullshit (may need to turn this off to view error messages)
  - Runs root5, alias "evAG" to set up a root6 environment

###whichMissing
  - whichMissing 205 will print the names in the current directory of any number i for which ntuple_i.root or merged_ntuple_i.root does not exist

###quad
  - adds numbers in quadrature

###countAG
  - number of files in current directory

###mergePDF 
  - merges PDF
  - mergePDF --help to display help message 
