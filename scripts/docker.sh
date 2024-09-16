#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

if [ ! -f /etc/apt/keyrings/docker.asc ]; then
    apt-get update
    apt-get install ca-certificates curl
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc
else
    echo "[$0] docker key is already installed"
fi

# Add the repository to Apt sources:
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
else
    echo "[$0] docker repo is already added"
fi

which docker >/dev/null

if [ "$?" -eq "1" ]; then
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "[$0] docker is already installed"
fi
