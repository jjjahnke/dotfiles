fpath=(~/.zsh/completion /opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit -i

function StartupSound {
  case "$1" in
    --on) sudo nvram StartupMute=%01
      ;;
    --off) sudo nvram StartupMute=%00
      ;;
  esac
}


source <(kubectl completion zsh)
source ~/dotfiles/config-kube-config.sh

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

appendpath() {
  if [[ -d "$1" ]]; then
    typeset -U path
    path+=("$1")
  fi
}

prependpath() {
  if [[ -d "$1" ]]; then
    typeset -U path
    path=("$1" $path)
  fi
}

setopt PROMPT_SUBST

# Setup a red prompt for root and a green one for users.
if [[ $EUID == 0 ]] ; then
  PROMPT='%F{red}%m %n [%f %. %F{red}]%f%F{magenta}$(parse_git_branch)%f ->'$'\n'
else
  PROMPT='%F{green}%m %n [%f %. %F{green}]%f%F{magenta}$(parse_git_branch)%f ->'$'\n'
fi

export AWS_SDK_LOAD_CONFIG=true

source ~/env_setup.sh
