#!/bin/bash

# install nvim 8 in debian
wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
sudo rm -f ./nvim-linux64.deb

echo 'NeoVim 0.8.0 installed successfully!'
