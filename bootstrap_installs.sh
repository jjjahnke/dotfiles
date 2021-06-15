#Yer gonna need this cause MacOS doesn't like to remember passphrases
#https://www.cyberciti.biz/faq/howto-fix-macos-keeps-asking-my-ssh-passphrase-since-i-updated-to-sierra/
#Make sure homebrew is installed

curl -s "https://get.sdkman.io" | bash
#node needs to be installed to make yvm work
brew install nvm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
tic tmux-256color.terminfo
