#!/bin/bash

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg

if [ ! -f /etc/apt/sources.list.d/spotify.list ]; then
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
fi

sudo apt-get update && sudo apt-get install -y spotify-client
