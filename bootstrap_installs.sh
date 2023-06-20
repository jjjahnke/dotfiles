#Yer gonna need this cause MacOS doesn't like to remember passphrases
#https://www.cyberciti.biz/faq/howto-fix-macos-keeps-asking-my-ssh-passphrase-since-i-updated-to-sierra/
#Make sure homebrew is installed

curl -s "https://get.sdkman.io" | bash
#node needs to be installed to make yvm work
brew install nvm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
tic tmux-256color.terminfo

#Install the latest version of krew
#https://krew.sigs.k8s.io/docs/user-guide/setup/install/
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

kubectl krew install ctx
kubectl krew install ns

#Copy the config file combiner script to the kube config directory
cp ~/dotfiles/config-kube-config.sh ~/.kube/
