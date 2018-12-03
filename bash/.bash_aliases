[[ -f /etc/lsb-release ]] && source bash_aliases.deb
[[ -f /etc/redhat-release ]] && source bash_aliases.rhel

alias ..="cd .."

alias ll="ls -hl"
alias isodate="date +%Y-%m-%dT%H:%M:%S"
alias move="rsync --progress --archive --stats --human-readable --remove-source-files"
alias isodate="date +%Y%m%dT%H%M"
alias grep="grep --color=always"
alias less="less -FR"
alias ld="ls -lhd"
alias ping="ping -c 5"

## git
alias g="git status"
alias gp="git pull"

## -> Prevents accidentally clobbering files.
alias rm='rm -iv --preserve-root'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -p'

alias which='type -all'

