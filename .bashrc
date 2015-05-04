#Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Movement Aliases
alias hadoop='cd /hadoop/cms/store/user/cgeorge'
alias core='cd /home/users/cgeorge/CORE/'
alias phys14='cd /hadoop/cms/store/group/snt/phys14'
alias cms3='cd /home/users/cgeorge/CMS3/CMSSW_7_2_0/src/CMS3/NtupleMaker'

#AN Aliases
alias compile='tdr --style=an b AN-14-005'
alias preview='scp /home/users/cgeorge/AN_14_005/notes/tmp/AN-14-005_temp.pdf cag@neutrino.physics.ucsb.edu:/www/htdocs/people/cag/'
alias an='cd ~/AN_14_005/notes/AN-14-005/trunk'
alias setupAN='eval `~/AN_14_005/notes/tdr runtime -sh`'
alias go='tdr --style=an b AN-14-005; scp /home/users/cgeorge/AN_14_005/notes/tmp/AN-14-005_temp.pdf cag@neutrino.physics.ucsb.edu:/www/htdocs/people/cag/'

#Other Aliases
alias lxplus='ssh cgeorge@lxplus.cern.ch'
alias swap='source swap.sh'
alias rooot='root -l -b'
alias rot='root -l -b -q'
alias roooot='root -l -b'
alias rooooot='root -l -b'
alias root='root -l'
alias ev='eval `scramv1 runtime -sh`'
alias evAG='pushd /home/users/cgeorge/CMS3/CMSSW_7_2_0 &> /dev/null; eval `scramv1 runtime -sh`; popd &> /dev/null'
alias voms='voms-proxy-init -valid 120:00' #-voms cms:/cms'
alias ls='ls -X --color=auto --ignore=*.{o,d,aux}'
alias crab3='source /cvmfs/cms.cern.ch/crab3/crab.sh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../..'

#Set up pdflatex to supress stupid warnings
alias pdflatex='pdflatex -interaction=batchmode'

#Fix vi
vi() {

    local args=("$@")
    local new=0

    # Check for `--new'.
    for ((i = 0; i < ${#args[@]}; ++i)); do
        if [[ ${args[$i]} = --new ]]; then
            new=1
            unset args[$i]   # Don't pass `--new' to vim.
        elif [[ ${args[$i]} = \-n ]]; then
            new=1
            unset args[$i]   # Don't pass `--new' to vim.
        fi
    done

    if ! (( new )); then
        for file in "${args[@]}"; do
            [[ $file = -* ]] && continue   

            if ! [[ -e $file ]]; then
                printf '%s: cannot access %s: No such file or directory\n' "$FUNCNAME" "$file" >&2
                return 1
            fi
        done
    fi

    if [[ -d ${!#} ]]; then
        cd "$@"
    else 
        command "$FUNCNAME" "${args[@]}"
    fi
}

r() {
    (($# == 2)) || { echo "r needs to args" >&2 ; return 1 ;}
    fc -s "$1"="$2"
}

#Fix spelling errors for cd
shopt -s cdspell

#Make history more useful
export PROMPT_COMMAND="history -a"
export HISTSIZE=30000
export HISTFILESIZE=30000
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups

eval $(dircolors -b ~/.dir_colors)

#CMSSW
source /code/osgcode/cmssoft/cmsset_default.sh  > /dev/null 2>&1
export SCRAM_ARCH=slc6_amd64_gcc481
export SCRAM_ARCH1=slc6_amd64_gcc491

#Crab
export GLITE_VERSION="gLite-3.2.11-1"
export LCG_GFAL_INFOSYS=lcg-bdii.cern.ch:2170
export GLOBUS_TCP_PORT_RANGE=20000,25000

#Pac Setup
source /home/users/cgeorge/ss2015/PAC/tools/env.sh

# git setup
git config --global user.name "Christopher A. George"
git config --global user.email "george@physics.ucsb.edu"
git config --global alias.co checkout
git config --global alias.ci 'commit -a -m'
git config --global alias.pu 'push origin master'
git config --global alias.up 'pull origin master'
git config --global alias.unstage 'reset HEAD'

#Root Config
source /code/osgcode/fgolf/5.30-patches/bin/thisroot.sh

#Load Python preferences
export PYTHONSTARTUP=$HOME/.pythonrc

#Put Scripts Directory into Path
PATH=$PATH:$HOME/scripts

#Add path
pathadd(){
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]
    then
      PATH="${PATH:+"$PATH:"}$1"
    fi
}

#Disable annoying mail messages
unset MAILCHECK
