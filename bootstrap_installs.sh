#Make sure homebrew is installed

curl -s "https://get.sdkman.io" | bash
#node needs to be installed to make yvm work
brew install nvm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
tic tmux-256color.terminfo
