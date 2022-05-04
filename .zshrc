function setjdk() {
  if [ $# -ne 0 ]; then
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
  fi
 }

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

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

setopt PROMPT_SUBST

# Setup a red prompt for root and a green one for users.
if [[ $EUID == 0 ]] ; then
  PROMPT='%F{red}%m %n [%f %. %F{red}]%f%F{magenta}$(parse_git_branch)%f ->'$'\n'
else
  PROMPT='%F{green}%m %n [%f %. %F{green}]%f%F{magenta}$(parse_git_branch)%f ->'$'\n'
fi

export AWS_SDK_LOAD_CONFIG=true
