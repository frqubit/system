#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mv ~/.cargo /usr/local/cargo
chown cski:cski /usr/local/cargo
