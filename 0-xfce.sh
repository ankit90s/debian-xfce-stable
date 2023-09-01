#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

clear

# Get username
username=$(id -u -n 1000)
builddr=$(pwd)

# Copy Source file
echo -e "\e[1;32m Copying sources.list file \e[0m"
mv /etc/apt/sources.list /etc/apt/sources.list.bkp
cp sources.list /etc/apt/sources.list
apt update && apt upgrade -y
apt install -y aptitude
apt install -y nala

## Xfce4 installation
echo -e "\e[1;32m Installing xfce4 \e[0m"
apt install -y xfce4 thunar gnome-system-tools libxfce4ui-utils

# Download Managers
echo -e "\e[1;32m Installing download managers \e[0m"
apt install -y curl wget axel aria2

## Xfce4 installation
echo -e "\e[1;32m Installing xfce desktop plugins \e[0m"
apt install -y clipman xfce4-clipman-plugin
apt install -y xfce4-power-manager
apt install -y thunar-archive-plugin
apt install -y xfce4-screenshooter
apt install -y xfce4-whiskermenu-plugin
wget https://mxrepo.com/mx/repo/pool/main/x/xfce4-docklike-plugin/xfce4-docklike-plugin_0.4.1-0.1~mx23+1_amd64.deb -O docklike.deb
apt install -y ./docklike.deb
rm docklike.deb

# Other essential packages
echo -e "\e[1;32m Installing essential packages \e[0m"
apt install -y xterm exa mugshot menulibre nvidia-detect

# Archiving tools
echo -e "\e[1;32m Installing archiving tools \e[0m"
apt install -y zip unzip 7zip

# Media Player
apt install -y mpv

# System Monitors
echo -e "\e[1;32m Installing conky nefetch htop \e[0m"
apt install -y conky neofetch htop

# Browser
echo -e "\e[1;32m Installing firefox-esr and chromium \e[0m"
apt install -y chromium

# PDF viewer
echo -e "\e[1;32m Installing Document viewer \e[0m"
apt install -y evince

# image viewer
echo -e "\e[1;32m Installing Image viewer \e[0m"
apt install -y gpicview

# cursor
echo -e "\e[1;32m Installing cursor themes \e[0m"
apt install -y bibata-cursor-theme dmz-cursor-theme

# terminal of choice
echo -e "\e[1;32m Installing terminal \e[0m"
apt install -y alacritty

# onboard keyboard
echo -e "\e[1;32m Installing onscreen keyboard \e[0m"
apt install -y onboard

# setup starship
echo -e "\e[1;32m Installing starship shell prompt \e[0m"
wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
tar -xvzf starship-x86_64-unknown-linux-musl.tar.gz
mv starship /usr/local/bin
rm starship-x86_64-unknown-linux-musl.tar.gz

# pfetch
echo -e "\e[1;32m Installing pfetch \e[0m"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch
install pfetch /usr/local/bin
cd ..
rm -rf pfetch

# Copy xresources
echo -e "\e[1;32m Copying xresources file \e[0m"
cp Xresources /home/$username/.Xresources
# cp Xresources ~/.Xresources

# copy bashrc and bash_aliases
echo -e "\e[1;32m Installing bashrc and bash aliases \e[0m"
cp bashrc /home/$username/.bashrc
cp bash_aliases /home/$username/.bash_aliases

# mkdir
echo -e "\e[1;32m Creating directory ISO in home folder \e[0m"
mkdir /home/$username/ISOs
chown $username:$username /home/$username/*

# wallpapers
echo -e "\e[1;32m Installing distrotube wallpaper collection \e[0m"
./4-wallpapers.sh

# install slick greeter
echo -e "\e[1;32m Installing slick greeter \e[0m"
apt install -y slick-greeter lightdm-gtk-greeter-settings lightdm-settings numlockx
rm -rf /etc/lightdm
cp -r settings/lightdm /etc

# Copy grub file
echo -e "\e[1;32m Installing grub cfg file \e[0m"
rm /etc/default/grub
cp settings/grub /etc/default
update-grub

echo
echo -e "\e[1;32m Rebooting please wait \e[0m"

sleep 5s
reboot


