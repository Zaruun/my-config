#!/bin/bash

# Update and Upgrade
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y wget

sudo apt install -y curl

sudo apt install -y git

sudo apt install -y htop

sudo apt install -y tmux

sudo apt install -y neofetch

sudo apt install -y mc

wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
sudo rm -f ./nvim-linux64.deb

echo 'NeoVim 0.8.0 installed successfully!'

mkdir .config
git clone https://github.com/zaruun/my-config

rm -rf ~/.config/nvim

cd ~/my-config/dotfiles

mv nvim ~/.config/nvim
cd ~
rm -rf my-config

# install zsh
sudo apt install zsh -y

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# config .zshrc
cd ~
sed -i 's/robbyrussell/bureau/' ~/.zshrc
source ~/.zshrc