#!/bin/bash

sudo apt install -y wget

sudo apt install -y curl

sudo apt install -y git

sudo apt install -y htop

sudo apt install -y tmux

sudo apt install -y neofetch
sudo rm -f /etc/update-motd.d/10-uname
sudo touch /etc/update-motd.d/10-uname

sudo cat << EOF > /etc/update-motd.d/10-uname
#!/bin/sh
echo
$(neofetch)
EOF

sudo apt install -y mc

