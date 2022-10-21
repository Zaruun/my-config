#!/bin/bash

git clone https://github.com/zaruun/my-config

rm -rf ~/.config/nvim

cd ~/my-config/dotfiles

mv nvim ~/.config/nvim
cd ~
rm -rf my-config