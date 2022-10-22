#!/bin/bash

git clone https://github.com/zaruun/my-config

if [ ! -d ~/.config/nvim ] 
then
    mkdir ~/.config
    mkdir ~/.config/nvim
fi

rm -rf ~/.config/nvim

cd ~/my-config/dotfiles

mv nvim ~/.config/nvim
cd ~
rm -rf my-config
