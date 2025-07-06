[ -s /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -z "$ENV_SETUP_SOURCED" ]; then
  source ~/env_setup.sh
  export ENV_SETUP_SOURCED=1
fi

#export ANSIBLE_HOST_KEY_CHECKING=False
