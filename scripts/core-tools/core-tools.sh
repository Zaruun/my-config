#!/bin/bash

sudo apt install -y wget

sudo apt install -y curl

sudo apt install -y git

sudo apt install -y htop

sudo apt install -y tmux

sudo apt install -y neofetch
echo "echo" >> /etc/update-motd.d/10-uname
echo "neofetch" >> /etc/update-motd.d/10-uname

sudo apt install -y mc

