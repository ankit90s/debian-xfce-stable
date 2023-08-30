#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

# Get username and make buliddr
username=$(id -u -n 1000)
builddr=$(pwd)

# Restricted extras
echo -e "\e[1;32m Installing restricted extras \e[0m"
apt install -y ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

# Network File Tools/System Events
echo -e "\e[1;32m Network File Tools and System Events \e[0m"
apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends locate mtp-tools

systemctl enable avahi-daemon
systemctl enable acpid

# Mesa and vulkan support
echo -e "\e[1;32m Installing mesa and vulkan support \e[0m"
apt install -y mesa-vulkan-drivers libvulkan1 vulkan-tools vulkan-validationlayers

# install build tools
echo -e "\e[1;32m Installing build tools \e[0m"
apt install -y build-essential linux-headers-$(uname -r) intel-microcode

echo 
echo -e "\e[1;32m Rebooting please wait \e[0m"

sleep 5s
reboot
