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
# Run Ansible playbook
ansible-playbook -i localhost _ansible/devenv.yaml --ask-become-pass

# Update .zshrc updater.sh path to alias
sed -i "s|#script_path_to_replace|cd $(pwd) \&\& sh $(pwd)/updater.sh|" ~/.zshrc
cat <<EOF

To reload the zsh configuration:

omz reload

EOF