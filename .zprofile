[ -s /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

source $HOME/.alias
source $HOME/.console

export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
export NVM_BASH_COMPLETITION="$NVM_DIR/bash_completion"
# If you load NVM from homebrew the paths are different.
[ -s "/opt/homebrew/opt/nvm" ] && export NVM_DIR="/opt/homebrew/opt/nvm"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && export NVM_BASH_COMPLETITION="/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR//nvm.sh"
[ -s "$NVM_BASH_COMPLETITION" ] && . "$NVM_BASH_COMPLETITION"
[ -s "$NVM_DIR/nvm.sh" ] && nvm use node

export GVM_DIR="$HOME/.gvm"
[ -s "$HOME/.gvm/scripts/gvm" ] && source "$HOME/.gvm/scripts/gvm"
if command -v go &> /dev/null; then
  go_version=$(go version 2>&1 | awk '{print $3}')
  echo "Now using golang v${go_version:2}"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[ -s "/opt/homebrew/bin/pyenv" ] && eval "$(pyenv init --path)"
if command -v pyenv &> /dev/null; then
  echo "Now using python v$(pyenv global) (pip v$(pip3 --version | awk '{print $2}'))"
fi

#export ANSIBLE_HOST_KEY_CHECKING=False
