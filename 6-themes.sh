#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

# Get username and make buliddr
username=$(id -u -n 1000)
builddr=$(pwd)

apt update

# dependencies
echo -e "\e[1;32m Installing theme dependencies \e[0m"
apt install -y gtk2-engines-murrine gtk2-engines-pixbuf

# dconf editor
echo -e "\e[1;32m Installing dconf editor \e[0m"
apt install -y dconf-editor

# Arc theme
echo -e "\e[1;32m Installing Arc theme \e[0m"
apt install -y arc-theme

# Materia theme
echo -e "\e[1;32m Installing Materia theme \e[0m"
apt install -y materia-gtk-theme

# mint themes
echo -e "\e[1;32m Installing linux mint themes \e[0m"

wget http://packages.linuxmint.com/pool/main/m/mint-x-icons/mint-x-icons_1.6.5_all.deb -O mint-x-icons.deb
apt install -y ./mint-x-icons.deb
rm mint-x-icons.deb

wget http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_2.1.5_all.deb -O mint-themes.deb
apt install -y ./mint-themes.deb
rm mint-themes.deb

# Colloid theme
git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
cd Colloid-gtk-theme
# ./install.sh -d /usr/share/themes --tweaks dracula
# ./install.sh -d /usr/share/themes --tweaks nord
./install.sh -d /usr/share/themes
# ./install.sh -d /usr/share/themes -t green
cd .. && rm -rf Colloid-gtk-theme

# Qogir themes
# git clone https://github.com/vinceliuice/Qogir-theme.git
# cd Qogir-theme
# ./install.sh -d /usr/share/themes --tweaks image square round
# cd .. && rm -rf Qogir-theme

# Colloid icons
echo -e "\e[1;32m Installing colloid icon theme \e[0m"
git clone https://github.com/vinceliuice/Colloid-icon-theme.git
cd Colloid-icon-theme
./install -d /usr/share/icons
cd .. && rm -rf Colloid-icon-theme

# Cursor Setup
echo -e "\e[1;32m Nordzy cursor theme \e[0m"
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors && sudo ./install.sh
cd ../ && rm -rf Nordzy-cursors

# Papirus icon
echo -e "\e[1;32m Installing papirus icon theme \e[0m"
apt install -y papirus-icon-theme -t bookworm-backports

# Papirus folder
echo -e "\e[1;32m Installing papirus folder theme \e[0m"
wget -qO- https://git.io/papirus-folders-install | sh
papirus-folders -C yaru --theme Papirus-Dark

# kde apps theme fix
echo -e "\e[1;32m Fix for qt-apps \e[0m"
apt install -y qt5-style-plugins
cp environment /etc/environment
