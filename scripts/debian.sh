#!/bin/bash

# Update and Upgrade
sudo apt update -y
sudo apt upgrade -y

# Install core-tools
sh -c "$(wget https://raw.githubusercontent.com/Zaruun/my-config/main/scripts/core-tools/core-tools.sh -O -)"

# Install NeoVim 0.8.0
sh -c "$(wget https://raw.githubusercontent.com/Zaruun/my-config/main/scripts/nvim/deb-install-nvim-8.sh -O -)"

# Configure nvim
sh -c "$(wget https://raw.githubusercontent.com/Zaruun/my-config/main/scripts/nvim/nvim-install-config.sh -O -)"

# Install and config zsh
sh -c "$(wget https://raw.githubusercontent.com/Zaruun/my-config/main/scripts/zsh/zsh-install-deb.sh -O -)"
