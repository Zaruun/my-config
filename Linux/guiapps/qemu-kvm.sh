#!/bin/bash 

chkCPU=$(egrep -c '(vmx|svm)' /proc/cpuinfo)

if [ $chkCPU -gt 0 ]; then
    :
else
    echo "CPU not supported."
    exit 1
fi

sudo apt update
sudo apt install qemu-kvm virt-manager virtinst libvirt-clients bridge-utils libvirt-daemon-system -y


sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd


sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER

sudo virt-manager