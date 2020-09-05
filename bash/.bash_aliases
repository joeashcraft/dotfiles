[[ -f /etc/lsb-release ]] && source bash_aliases.deb
[[ -f /etc/redhat-release ]] && source bash_aliases.rhel

alias ..="cd .."
alias isodate="date +%Y-%m-%dT%H:%M:%S"
alias move="rsync --progress --archive --stats --human-readable --remove-source-files"
alias isodate="date +%Y%m%dT%H%M"
alias less="less -FR"
alias ping="ping -c 5"
alias sudoedit="sudo ${EDITOR:-vim}"
alias vls="ls -1 ${WORKON_HOME}"
# alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias pipu="pip list --outdated --local --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
alias ulocate="locate -d ${HOME}/.mlocate.db"
function userdb {
    updatedb -U ${HOME} -o ${HOME}/.mlocate.db  --prune-bind-mounts yes --require-visibility no
}


########################################
###            ls options            ###
########################################
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
  export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
  colorflag="-G"
  export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias ll="ls -hlF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -hlAF ${colorflag}"

# List only directories
alias ld="ls -hld ${colorflag} */"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

########################################
###           grep options           ###
########################################
# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'




## git
alias g="git status"
alias gp="git pull"

## -> Prevents accidentally clobbering files.
alias rm='rm -iv --preserve-root'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -p'

alias which='type -all'
