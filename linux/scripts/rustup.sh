#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

if [ ! -d /usr/local/cargo ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    mv ~/.cargo /usr/local/cargo
    mv ~/.rustup /usr/local/rustup
    chown cski:cski /usr/local/cargo

    # if you don't do this your sign in may break :annoyed:
    cat ~/.profile | sed '/\.cargo\/env/d' > ~/.profile_new
    rm ~/.profile
    mv ~/.profile_new ~/.profile
else
    echo "[$0] rust is already installed"
fi
