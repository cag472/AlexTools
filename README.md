#Alex Tools

These are the tools that mostly live in Alex's script directory.  Listed here in rough order of usefulness

###pwdag 
  - pwdag BLAH will give an absolute path for BLAH.  

###.bashrc
  Special features:
  - If you type "vi" instead of "cd", it will do the right thing
  - If you try to "vi" a file that doesn't exist, it will complain (override with -n) rather than opening a blank file
  - If you cd to a directory and spell it wrong, it will fix it
  - Fixes r so you can run files normally
  - Use "r" to execute any program, regardless of language.  With no arguments, it opens an interactive r session.

###quad
  - adds numbers in quadrature

###countAG
  - number of files in current directory

###mergePDF 
  - merges PDF
  - mergePDF --help to display help message 

###monitorMemory
  - e-mails me an alert when the system memory usage exceeds 115 GB
  - add this to /etc/crontab: `*/5 *   * * *   root    . /home/sauron/AlexTools/monitorMemory`
  - need to set up e-mail account (burner) at `/etc/ssmtp/ssmtp.conf`, don't forget to set `UseSTARTTLS=YES`

###whichMissing (deprecated)
  - whichMissing 205 will print the names in the current directory of any number i for which ntuple\_i.root or merged\_ntuple\_i.root does not exist
  - Deprecated for now, but might be useful for other patterns

###web (deprecated)
Transports things to the internet.
  - First argument "--ucsb" if you want this at hep.ucsb.edu, will otherwise post at uaf-7.t2.ucsd.edu (faster)
  - Following argument "-d BLAH" to have all these files placed in the BLAH directory
  - All subsequent arguments are the things you want to post
  - Deprecated, need to find non-UC hosting

###.tmux.conf (partially deprecated)
  - A sort of ``bashrc'' for tmux.  Most of this is just reducing annoyances, but note that it remaps the prefix from ctrl-b to ctrl-\ (which is really important).  
  - I don't use tmux much anymore, it's annoying, I should figure it out one day.  

