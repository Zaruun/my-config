#!/bin/bash

tmpDir="/tmp/alacritty"

git clone https://github.com/alacritty/alacritty.git $tmpDir && cd $tmpDir

sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

cargo install alacritty

sudo cp ~/.cargo/bin/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database


rm -rf ~/.cargo/bin/alacritty
rm -rf $tmpDir
