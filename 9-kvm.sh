#!/bin/bash

sudo apt update

# Command to Install QEMU-KVM & Libvirt on Debian 12 Bookworm
sudo apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon

# Virt-Manager GUI for KVM
sudo apt install -y virt-manager

# Make Network active and auto-restart
sudo virsh net-list --all
sudo virsh net-start default
sudo virsh net-autostart default

# Add “vhost_net”
sudo modprobe vhost_net
lsmod | grep vhost


