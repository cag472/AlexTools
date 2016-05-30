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

#Fix spelling errors for cd
shopt -s cdspell

#Make history more useful
export PROMPT_COMMAND="history -a"
export HISTSIZE=30000
export HISTFILESIZE=30000
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups

#Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../..'

#More aliases
alias preview='open /Applications/Preview.app'

#Fix R
r(){
  if [ "$#" == "0" ]; then command r --no-save; else command Rscript $1 ; fi
}

#Path
PATH=$PATH:/Users/alexgeorge/Applications/pypy-5.1.1-osx64/bin/:/Users/alexgeorge/CODE/scripts/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/python2.7/
export PYTHONPATH=/Users/alexgeorge/.local/lib/python2.7/site-packages/
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH

#Show full path
PS1='\w\$ '

#Color scheme
export CLICOLOR=TRUE

#Git stuff
git config --global user.name "Alex George"
git config --global user.email "alex.george@bostonfusion.com"
