#!/bin/bash


wget https://nodejs.org/dist/v18.12.0/node-v18.12.0-linux-x64.tar.xz

tar -xf node-v18.12.0-linux-x64.tar.xz
cd node-v18.12.0-linux-x64

sudo cp -r ./{lib,share,include,bin} /usr
sudo npm install -g tree-sitter-cli
