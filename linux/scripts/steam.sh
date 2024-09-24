#!/bin/bash

install_steam() {
    sudo apt-get install steam
}

which steam >/dev/null

if [ "$?" -eq "1" ]; then
    install_steam
else
    grep -Fxq "force_reinstall" $EXTRAS_FILE
    if [ "$?" -eq "0" ]; then
        install_steam
    else
        echo "[$0] steam is already installed"
    fi
fi
