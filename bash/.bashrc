# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

########################################
###           bash options           ###
########################################
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL="ignoredups"

# increase size of history
export HISTFILESIZE=500000
export HISTSIZE=100000

# history should ignore 'exit' command
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear"

# history timestamps
export HISTTIMEFORMAT="%F %T "

# history should append, not overwrite
shopt -s histappend

# save multi-line commands as a single command in history
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Perform history expansion on the current line and insert a space.
bind space:magic-space


########################################
###           Util Options           ###
########################################
# make less more friendly for non-text input files (e.g. gzip), see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


########################################
###            Python Dev            ###
########################################
export PYTHONWARNINGS="ignore:Unverified HTTPS request"
export WORKON_HOME=$HOME/.virtualenvs
export PATH=~/bin:$PATH


## exports before source'ing!
declare -a files_to_source
files_to_source=(
  "/etc/bash_completion"
  "/usr/local/etc/bash_completion"
  ".bash_colors"
  ".bash_aliases"
  ".bash_functions"
  # ".bash_profile"
  ".bashrc.mac"
  ".bashrc.work"
  ".openstack_auth"
  "$(brew --prefix)/etc/bash_completion.d/brew"
  #"/usr/local/bin/virtualenvwrapper_lazy.sh"
  "/usr/local/etc/bash_completion.d/pass"
  #".pyenv/versions/anaconda3-5.2.0/etc/profile.d/conda.sh"
  ".iterm2_shell_integration.bash"
)
for ff in ${files_to_source[@]}; do
  [[ -f "$ff" ]] && source "$ff"
done

## pyenv auto activation
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\[$(tput setaf 1)\]\u@\h:\w #\[$(tput sgr0)\]"
else # normal
#  PS1="[\[\033[32m\]\u\[\033[0m\]@\[\033[34m\]\h \[\033[31m\]\w\[\033[0m\]]$ "
  PS1="$BRIGHT_GREEN\u$WHITE@$BRIGHT_BLUE\h $RED\w$WHITE$ "
fi
