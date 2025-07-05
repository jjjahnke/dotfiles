# Dotfiles Repository

This repository contains configuration files and scripts, commonly known as "dotfiles," used to set up and customize a development environment. These files help automate the setup process and ensure a consistent environment across different machines.

## Contents

- **Shell Configuration**: 
  - `.bashrc`, `.zshrc`, `.profile`, and `.zprofile` for setting up the shell environment with aliases, functions, and environment variables.

- **Aliases**:
  - `.alias`, `.alias-aws`, and `.alias-reddit` for command shortcuts to simplify command-line tasks.

- **Bootstrap Scripts**:
  - `bootstrap.sh`, `bootstrap-zsh.sh`, and `bootstrap_installs.sh` for setting up symbolic links and installing necessary tools.

- **Git Configuration**:
  - `.gitignore` to exclude specific files and directories from being tracked by Git.

- **Terminal and Tmux Configuration**:
  - `.tmux.conf` and `tmux-256color.terminfo` for configuring the Tmux terminal multiplexer.

- **Kubernetes Configuration**:
  - `config-kube-config.sh` for managing Kubernetes configuration files.

## Usage

1. Clone the repository to your home directory.
2. Run the bootstrap scripts to set up your environment:
   ```bash
   ./bootstrap.sh
   ./bootstrap-zsh.sh
   ./bootstrap_installs.sh
   ```
3. Customize the dotfiles as needed for your specific setup.

## License

This repository is licensed under the MIT License.
