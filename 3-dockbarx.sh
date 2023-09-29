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

apt install -y gir1.2-gtk-3.0 gir1.2-glib-2.0 gir1.2-keybinder-3.0 gir1.2-pango-1.0 gir1.2-wnck-3.0 python3-cairo python3-dbus python3-distutils python3-gi python3-gi-cairo python3-pil python3-polib python3-xdg python3-xlib

apt install -y gir1.2-zeitgeist-2.0 zeitgeist
apt install -y ayatana-indicator-application
apt install -y python3-pyudev 
apt install -y python3-lxml

