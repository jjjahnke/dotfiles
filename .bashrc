source $HOME/.alias
source $HOME/.console

alias t=todo.sh
complete -F _todo t

function StartupSound {
  case "$1" in
    --on) sudo nvram StartupMute=%01
      ;;
    --off) sudo nvram StartupMute=%00
      ;;
  esac
}


# Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Setup a red prompt for root and a green one for users.
NORMAL="\[\e[00m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
MAGENTA="\[\e[35m\]"
if [[ $EUID == 0 ]] ; then
        PS1="$RED\h \u [ $NORMAL\w$RED ]$MAGENTA\$(parse_git_branch)$RED $\[\033[00m\] "
else
        PS1="$GREEN\h \u [ $NORMAL\w$GREEN ]$MAGENTA\$(parse_git_branch)$GREEN $\[\033[00m\] "
fi


appendpath() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$PATH:$1"
    fi
}

prependpath() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1:$PATH"
    fi
}

appendpath "$HOME/.tmuxifier/bin"

if which tmuxifier > /dev/null; then eval "$(tmuxifier init -)"; fi

source ~/env_setup.sh

