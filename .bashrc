#Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Movement Aliases
alias hadoop='cd /hadoop/cms/store/user/cgeorge'
alias ss='cd /home/users/cgeorge/analysis/SS'
alias crd='cd /home/users/cgeorge/NtupleMaking/CMSSW_5_3_2_patch5/crab'
alias wd='cd /home/users/cgeorge/analysis/MadGraph_Project/Frank/CMSSW_5_2_6/src/GenAnalyzer/TestAnalyzer/test'
alias cf='cd /home/users/cgeorge/analysis/ChargeFlips'
alias mg='cd /home/users/cgeorge/ss2015/rare_syst_study/CMSSW_7_2_0/genproductions/bin/MadGraph5_aMCatNLO/interactive/interactive_gridpack/work'
alias core='cd /home/users/cgeorge/CORE/'
alias out='cd /home/users/cgeorge/analysis/outreach_0413'
alias stop='cd /home/users/cgeorge/analysis/stop_0613'
alias mini='cd /home/users/cgeorge/analysis/stop_0613/addl_signal/makeMiniBaby/SingleLepton2012/macros/MiniBabyMaker'
alias cms2='cd ~/analysis/stop_0613/addl_signal/makeCMS2/CMSSW_5_3_11_patch4'
alias baby='cd /home/users/cgeorge/analysis/stop_0613/addl_signal/makeBabies/CMSSW_5_3_2_patch4-stop-babies/src/SingleLepton2012/looper/'
alias alec='cd /home/users/aaivazis/susy/analysis'
alias phys14='cd /hadoop/cms/store/group/snt/phys14'
alias dan='cd /home/users/danphan/OSAnalysis'
alias jack='cd /home/users/yanjunhe/OSAnalysis'
alias cms3='cd /home/users/cgeorge/CMS3/CMSSW_7_2_0/src/CMS3/NtupleMaker'

#AN Aliases
alias compile='tdr --style=an b AN-14-005'
alias preview='scp /home/users/cgeorge/AN_14_005/notes/tmp/AN-14-005_temp.pdf cag@neutrino.physics.ucsb.edu:/www/htdocs/people/cag/'
alias an='cd ~/AN_14_005/notes/AN-14-005/trunk'
alias setupAN='eval `~/AN_14_005/notes/tdr runtime -sh`'
alias go='tdr --style=an b AN-14-005; scp /home/users/cgeorge/AN_14_005/notes/tmp/AN-14-005_temp.pdf cag@neutrino.physics.ucsb.edu:/www/htdocs/people/cag/'

#Set up pdflatex to supress stupid warnings
alias pdflatex='pdflatex -interaction=batchmode'

#Set up Crab3
#source /cvmfs/cms.cern.ch/crab3/crab.sh

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
#Other Aliases
alias lxplus='ssh cgeorge@lxplus.cern.ch'
alias swap='source swap.sh'
alias rooot='root -l -b'
alias rot='root -l -b -q'
alias roooot='root -l -b'
alias rooooot='root -l -b'
alias root='root -l'
alias ev='eval `scramv1 runtime -sh`'
alias voms='voms-proxy-init -valid 120:00' #-voms cms:/cms'
alias ls='ls -X --color=auto --ignore=*.{o,d,aux}'
alias dalitz='cd ~/analysis/MadGraph_Project/Frank/CMSSW_5_2_6/src/GenAnalyzer/TestAnalyzer/test'
alias pushdd='pushd .'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../..'

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
#source /code/osgcode/fgolf/5.30-patches/bin/thisroot.sh
source /cvmfs/cms.cern.ch/slc6_amd64_gcc481/lcg/root/5.34.22-cms4/bin/thisroot.sh
export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH:/cvmfs/cms.cern.ch/crab3/slc6_amd64_gcc481/external/gcc/4.8.1/lib64:/cvmfs/cms.cern.ch/slc6_amd64_gcc481/cms/cmssw-patch/CMSSW_7_2_0_patch1/external/slc6_amd64_gcc481/lib
export CMS_PATH=/cvmfs/cms.cern.ch
source /cvmfs/cms.cern.ch/cmsset_default.sh
source /cvmfs/cms.cern.ch/slc6_amd64_gcc481/lcg/root/5.34.18/bin/thisroot.sh
export LD_LIBRARY_PATH=$PWD/lib/slc6_amd64_gcc481:$LD_LIBRARY_PATH
export PATH=$PWD:$PATH
export PYTHONPATH=$PWD/python:$PYTHONPATH:$ROOTSYS/bin:$HOME/bin

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
