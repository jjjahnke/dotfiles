[ -s /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

source ./.alias
source ./.console
source ./.zshrc

autoload -Uz compinit
compinit


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

export YVM_DIR="$HOME/.yvm"
[ -r "$YVM_DIR/yvm.sh" ] && . "$YVM_DIR/yvm.sh"

export GVM_DIR="$HOME/.gvm"
[ -s "$HOME/.gvm/scripts/gvm" ] && source "$HOME/.gvm/scripts/gvm"
