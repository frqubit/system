#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
