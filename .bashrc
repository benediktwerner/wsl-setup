# Modified from sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

export EDITOR=/usr/bin/vim

test -s ~/.alias && . ~/.alias || true


### CUSTOM STUFF ###
# SSH AGENT
if [ -z "$(pgrep ssh-agent)" ]; then
    rm -rf /tmp/ssh-*
    eval $(ssh-agent -s) > /dev/null
else
    export SSH_AGENT_PID=$(pgrep ssh-agent)
    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

# Add ssh key on startup, Anoying as hell
#if [ "$(ssh-add -l)" == "The agent has no identities." ]; then
#    ssh-add
#fi


# GPG Agent
eval "$(gpg-agent --daemon 2> /dev/null)"

# Man page use default
export MAN_POSIXLY_CORRECT=1

# Git autocompletion
source /etc/bash_completion.d/git.sh
# source /etc/bash_completion.d/hub.bash_completion.sh

# Git prompt
source /opt/gitstatus/gitstatus.prompt.sh

LS_COLORS=$LS_COLORS:'ow=01;42:'; export LS_COLORS


# Make bash history eternal
# Taken from https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T]"
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


# Vagrant
export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1

# PATH
export PATH="$PATH:$HOME/.npm-global/bin"       # NPM
export PATH="$PATH:/usr/local/go/bin"           # Go
export PATH="$PATH:/mnt/c/Windows/System32"     # Windows
export PATH="$HOME/.cargo/bin:$PATH"            # Rust

export GOPATH="$HOME/go"

export RUST_BACKTRACE=1
export CARGO_TARGET_DIR="$HOME/.cargo/target"

export DISPLAY=:0
export BROWSER="browser"


# This is used by some bash-completion scripts
# It's usually defined by the bash-completion package but it sucks so I don't want it installed

_filedir() {
    COMPREPLY=()
    compopt -o bashdefault -o default
    if [[ $1 == -d ]]; then
        compopt -o dirnames
    fi
}


# Useful functions
function up() {
  times=$1
  while [ "$times" -gt "0" ]; do
    cd ..
    times=$(($times - 1))
  done
}

function x () {
  for file in "$@"; do
    if [ -f "$file" ] ; then
      case "$file" in
        *.tar.bz2)   tar xjf "$file"    ;;
        *.tar.gz)    tar xzf "$file"    ;;
        *.tar.xz)    tar Jxf "$file"    ;;
        *.bz2)       bunzip2 "$file"    ;;
        *.rar)       rar x "$file"      ;;
        *.gz)        gunzip -k "$file"  ;;
        *.tar)       tar xf "$file"     ;;
        *.tbz2)      tar xjf "$file"    ;;
        *.tgz)       tar xzf "$file"    ;;
        *.zip)       unzip "$file"      ;;
        *.Z)         uncompress "$file" ;;
        *.7z)        7z x "$file"       ;;
        *)           echo "don't know how to extract '$file'" ;;
      esac
    else
      echo "'$file' is not a valid file!"
    fi
  done
}
