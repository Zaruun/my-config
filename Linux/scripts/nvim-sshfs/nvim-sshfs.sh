#!/bin/bash

# This script mounts an SSH server to a target directory using sshfs,
# opens the target directory in nvim (NeoVim), and then unmounts
# the target directory from the SSH server.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <server>"
    exit 1
fi

server=$1

random_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

target_dir="$HOME/$random_name"

mkdir -p "$target_dir"

if sshfs "$server" "$target_dir"; then
    echo "Mounted successfully."
    nvim "$target_dir"
    fusermount -u "$target_dir"
    rmdir "$target_dir"
else
    echo "Mounting failed. Check for errors above."
    rmdir "$target_dir"
    exit 1
fi