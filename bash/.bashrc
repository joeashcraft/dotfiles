# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
PS1="[\u@\H:\w]\$ "

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL="erasedups:ignoreboth"

# increase size of history
export HISTFILESIZE=500000
export HISTSIZE=100000

# history should ignore 'exit' command
export HISTIGNORE="&:[ ]*:exit"

# history should append, not overwrite
shopt -s histappend

# save multi-line commands as a single command in history
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/dotfiles/bash_aliases ]] && source ~/dotfiles/bash_aliases

bind space:magic-space
