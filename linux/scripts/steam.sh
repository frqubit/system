#!/bin/bash

which steam >/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://repo.steampowered.com/steam/archive/precise/steam_latest.deb" -o steam.deb
    sudo dpkg -i steam.deb
    rm steam.deb
else
    echo "[$0] steam is already installed"
fi
