#!/bin/bash

cat <<EOF

██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗██████╗
██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  ██████╔╝
██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  ██╔══██╗
╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗██║  ██║
 ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

EOF

# Check if Ansible is installed
if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Ansible is not installed. Installing..."

    # Install Ansible
    sudo apt update
    sudo apt install -y ansible

    echo "Ansible installed successfully."
else
    echo "Ansible is already installed."
fi

# Update local dir from git
cat <<EOF

Checking git repository for updates...

EOF
git pull

echo ""
if [ "$1" == "-t" ]; then
    if [ -n "$2" ]; then
      ansible-playbook -i localhost _ansible/devenv.yaml --ask-become-pass --tags $2
    else
        echo "With -t parameter you need to specify tag name."
    fi
else
  ansible-playbook -i localhost _ansible/devenv.yaml --ask-become-pass
fi


# Update .zshrc updater.sh path to alias
sed -i "s|#script_path_to_replace|cd $(pwd) \&\& bash $(pwd)/updater.sh|" ~/.zshrc
sed -i "s|#script_path_to_replace2|cd $(pwd) \&\& bash $(pwd)/updater.sh -t \"\$1\"|" ~/.zshrc
  
cat <<EOF

To reload the zsh configuration:

omz reload

EOF
