#!/bin/bash

curl "https://dl.discordapp.net/apps/linux/0.0.68/discord-0.0.68.deb" -o discord.deb
sudo dpkg -i discord.deb
rm discord.deb

