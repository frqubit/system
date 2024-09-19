#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

which krita >/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://nnenix.mm.fcix.net/kdeftp/stable/krita/5.2.3/krita-5.2.3-x86_64.appimage" -o krita
    chmod +x ./krita
    chown root:root ./krita
    mv ./krita /usr/local/bin
else
    echo "[$0] krita is already installed"
fi
