#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

cp ../config/001_sources.list /etc/apt/sources.list
apt-get update

cp ../config/002_sources.list /etc/apt/sources.list
apt-get update
