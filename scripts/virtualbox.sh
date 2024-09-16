#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

which virtualbox >/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://download.virtualbox.org/virtualbox/7.0.20/virtualbox-7.0_7.0.20-163906~Debian~bookworm_amd64.deb" -o virtualbox.deb
    sudo dpkg -i virtualbox.deb
    rm virtualbox.deb
else
    echo "[$0] virtualbox is already installed"
fi
