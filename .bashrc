(which gnutar >/dev/null) && alias tar=$(which gnutar)
(which gtar >/dev/null) && alias tar=$(which gtar)

alias vi='vim'

alias tmux='tmux -2'

alias randomid='base64 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1'

alias restartVideo='sudo killall VDCAssistant'
alias restartAudio='sudo killall coreaudiod'
alias reloadAudio='sudo launchctl unload /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist && sudo launchctl load /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist'

alias flushCache='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

alias t=todo.sh
complete -F _todo t

alias xssh='TERM=xterm-color ssh'

# Color dir output in screen
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -GF'

function StartupSound {
  case "$1" in
    --on) sudo nvram StartupMute=%01 
      ;;
    --off) sudo nvram StartupMute=%00
      ;;
  esac
}

function setjdk() {
  if [ $# -ne 0 ]; then
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
  fi
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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

[ -x "$(command -v pyenv)"  ] && eval "$(pyenv init -)"

export SDKMAN_DIR="/Users/jjahnke/.sdkman"
[[ -s "/Users/jjahnke/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jjahnke/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export YVM_DIR=/Users/jahnke/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
