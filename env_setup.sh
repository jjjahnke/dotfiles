# SDKMAN setup
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# NVM setup
export NVM_DIR="$HOME/.nvm"
export NVM_BASH_COMPLETION="$NVM_DIR/bash_completion"
# If you load NVM from homebrew the paths are different.
[ -s "/opt/homebrew/opt/nvm" ] && export NVM_DIR="/opt/homebrew/opt/nvm"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && export NVM_BASH_COMPLETION="/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_BASH_COMPLETION" ] && \. "$NVM_BASH_COMPLETION"

if command -v node &> /dev/null; then
  echo "Now using node v$(node -v)"
fi

# GVM setup
export GVM_DIR="$HOME/.gvm"
[ -s "$GVM_DIR/scripts/gvm" ] && source "$GVM_DIR/scripts/gvm"
if command -v go &> /dev/null; then
  go_version=$(go version 2>&1 | awk '{print $3}')
  echo "Now using golang v${go_version:2}"
fi

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init --path)"
if command -v pyenv &> /dev/null; then
  echo "Now using python v$(pyenv global) (pip v$(pip3 --version | awk '{print $2}'))"
fi
