#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

apt-get install openjdk-17-jdk -y
apt-get install openjdk-17-jre -y
