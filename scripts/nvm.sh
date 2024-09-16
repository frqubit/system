#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

NVM_DIR="/usr/local/share/nvm"
mkdir -p $NVM_DIR

if [ ! -f $NVM_DIR/nvm.sh ]; then
    export NVM_DIR=$NVM_DIR && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"
else
    echo "[$0] nvm is already installed"
fi
