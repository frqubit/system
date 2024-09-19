#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

if [ -z ${REPO_DIR+x} ]; then
    echo "[$0] this script requires a \$REPO_DIR variable but it wasn't set. the script was shut down for your system's safety."
    exit 1
fi

cp $REPO_DIR/config/001_sources.list /etc/apt/sources.list
apt-get update

cp $REPO_DIR/config/002_sources.list /etc/apt/sources.list
apt-get update
