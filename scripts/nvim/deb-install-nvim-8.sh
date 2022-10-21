#!/bin/bash

# install nvim 8 in debian
wget https://github.com/Zaruun/my-config/blob/main/scripts/nvim/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb

echo 'NeoVim 0.8.0 installed successfully!'
