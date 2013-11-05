## PACKAGE MANAGEMENT
alias ins="sudo yum -y install"
alias rem="sudo yum -y remove"
alias psch="yum -q search"
alias update="sudo yum -y -q check-update"
alias upgrade="sudo yum -y update"
alias info="yum -q info"

## NAVIGATION
alias ..="cd .."

alias ll="ls -hl"
alias isodate="date +%Y-%m-%dT%H:%M:%S"
alias move="rsync --progress --archive --stats --human-readable --remove-source-files"
alias isodate="date +%Y%m%dT%H%M"
alias grep="grep --color=always"
alias less="less -FR"
alias ld="ls -lhd"
alias ping="ping -c 5"

function www {
    python -m SimpleHTTPServer $1
}


## -> Prevents accidentally clobbering files.
alias rm='rm -iv --preserve-root'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -p'

alias which='type -all'


function myip {
  echo -n "External IP: "
  curl -l ifconfig.me; echo
}


function ii()   # get current host related info
{
  echo -e "\nYou are logged on \e[0;34m $HOSTNAME\e[m"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Memory stats :$NC " ; free -m
  echo
}
