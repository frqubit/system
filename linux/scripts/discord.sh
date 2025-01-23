#!/bin/bash

LATEST_VERSION="0.0.81"

install_discord() {
    curl "https://dl.discordapp.net/apps/linux/$LATEST_VERSION/discord-$LATEST_VERSION.deb" -o discord.deb
    sudo dpkg -i discord.deb
    rm discord.deb
}

which discord >/dev/null

if [ "$?" -eq "1" ]; then
    # Discord is not installed
    install_discord
else
    echo "[$0] discord is already installed"
    echo "[$0] checking for updates..."

    discord_version=$(dpkg -s discord | grep '^Version:' | awk '{print $2}')

    if [[ ! "$discord_version" == "$LATEST_VERSION" ]]; then
        echo "[$0] updating discord..."

        install_discord
    else
        echo "[$0] discord is up to date!"
    fi
fi
