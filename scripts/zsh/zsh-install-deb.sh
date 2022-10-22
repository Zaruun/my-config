#!/bin/bash

# install zsh
sudo apt install zsh -y

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# config .zshrc
cd ~
sed -i 's/robbyrussell/bureau/' ~/.zshrc
source ~/.zshrc