#!/bin/bash

which discord >/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://dl.discordapp.net/apps/linux/0.0.68/discord-0.0.68.deb" -o discord.deb
    sudo dpkg -i discord.deb
    rm discord.deb
else
    echo "[$0] discord is already installed"
fi
