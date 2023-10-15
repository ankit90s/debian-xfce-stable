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

# dispplay server 
echo -e "\e[1;32m Installing xorg dispay server \e[0m"
apt install -y xorg

## Xfce4 installation
echo -e "\e[1;32m Installing xfce4 \e[0m"
apt install -y xfce4

# network manager
apt install -y network-manager-gnome

# Download Managers
echo -e "\e[1;32m Installing download managers \e[0m"
apt install -y curl wget axel aria2

## Xfce4 installation
echo -e "\e[1;32m Installing xfce desktop plugins \e[0m"
apt install -y clipman xfce4-clipman-plugin
apt install -y xfce4-power-manager
apt install -y xfce4-panel-profiles
apt install -y xfce4-appmenu-plugin
apt install -y thunar-archive-plugin
apt install -y xfce4-taskmanager
apt install -y xfce4-sensors-plugin
apt install -y xfce4-screenshooter
apt install -y xfce4-whiskermenu-plugin
wget https://mxrepo.com/mx/repo/pool/main/x/xfce4-docklike-plugin/xfce4-docklike-plugin_0.4.1-0.1~mx23+1_amd64.deb -O docklike.deb
apt install -y ./docklike.deb
rm docklike.deb

echo -e "\e[1;32m Installed exa \e[0m"
apt install -y exa 

echo -e "\e[1;32m Installed mugshot \e[0m"
apt install -y mugshot

echo -e "\e[1;32m Installed menulibre \e[0m"
apt install -y menulibre

echo -e "\e[1;32m Installed nvidia-detect \e[0m"
apt install -y nvidia-detect

echo -e "\e[1;32m Installed zip unzip 7zip \e[0m"
apt install -y zip unzip 7zip

echo -e "\e[1;32m Installed mpv \e[0m"
apt install -y mpv mpv-mpris

echo -e "\e[1;32m Installed conky nefetch htop \e[0m"
apt install -y conky neofetch htop

echo -e "\e[1;32m Installed firefox-esr or chromium \e[0m"
 wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" 
 tar -xf firefoxsetup.tar.bz2 --directory /opt
 cp settings/firefox-stable.desktop /usr/share/applications
 ln -s /opt/firefox/firefox /usr/local/bin/firefox
 update-alternatives --install /usr/bin/x-www-browser x-www-browser /opt/firefox/firefox 200 && sudo update-alternatives --set x-www-browser /opt/firefox/firefox 

echo -e "\e[1;32m Installed Evince document viewer \e[0m"
apt install -y evince

echo -e "\e[1;32m Installed gpicview image viewer \e[0m"
apt install -y gpicview

echo -e "\e[1;32m Installed cursor themes \e[0m"
apt install -y bibata-cursor-theme dmz-cursor-theme

echo -e "\e[1;32m Installed default terminal as alacritty \e[0m"
apt install -y alacritty
update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 200 && update-alternatives --set x-terminal-emulator /usr/bin/alacritty

echo -e "\e[1;32m Installed onscreen keyboard \e[0m"
apt install -y onboard

echo -e "\e[1;32m Installed starship shell prompt \e[0m"
wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
tar -xvzf starship-x86_64-unknown-linux-musl.tar.gz
mv starship /usr/local/bin
rm starship-x86_64-unknown-linux-musl.tar.gz

echo -e "\e[1;32m Installed pfetch \e[0m"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch
install pfetch /usr/local/bin
cd ..
rm -rf pfetch

echo -e "\e[1;32m Copying xresources file \e[0m"
cp Xresources /home/$username/.Xresources
# cp Xresources ~/.Xresources

echo -e "\e[1;32m Installing bashrc and bash aliases \e[0m"
cp bashrc /home/$username/.bashrc
cp bash_aliases /home/$username/.bash_aliases

cp bashrc-root /root/.bashrc
cp bash_aliases /root/.bash_aliases

# mkdir
echo -e "\e[1;32m Creating directory ISO in home folder \e[0m"
mkdir /home/$username/ISOs
chown -Rv $username:$username /home/$username/

echo -e "\e[1;32m Installed slick greeter \e[0m"
apt install -y slick-greeter lightdm-gtk-greeter-settings lightdm-settings numlockx
rm -rf /etc/lightdm
cp -r settings/lightdm /etc

# Copy grub file
echo -e "\e[1;32m Installed grub cfg file \e[0m"
rm /etc/default/grub
cp settings/grub /etc/default
update-grub

echo
echo -e "\e[1;32m Rebooting Now \e[0m"

sleep 5s
reboot
