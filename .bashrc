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
GPG_PROCESS=`cut -d: -f 2 $HOME/.gpg-agent-info 2> /dev/null`
if test -f $HOME/.gpg-agent-info && kill -0 ${GPG_PROCESS} 2> /dev/null && [[ ${GPG_PROCESS} == `pgrep -x -u "${USER}" gpg-agent` ]]; then
    GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
else
    if ls /tmp/gpg-* &> /dev/null; then
        rm -r /tmp/gpg-*
    fi
    eval `gpg-agent --daemon --no-grab --write-env-file $HOME/.gpg-agent-info`
fi
export GPG_TTY=`tty`
export GPG_AGENT_INFO


# Git autocompletion
source /usr/share/bash-completion/completions/git

# Git prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto verbose git"
export PS1=' λ \[\e[34m\]\w\[\e[m\]\[\e[31m\]$(__git_ps1 " [%s]")\[\e[93m\]»\[\e[m\] '


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


# Useful functions
function up() {
  times=$1
  while [ "$times" -gt "0" ]; do
    cd ..
    times=$(($times - 1))
  done
}
