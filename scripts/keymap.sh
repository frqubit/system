#!/bin/bash

dconf write /org/gnome/settings-daemon/plugins/media-keys/next "['F7']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/play "['F6']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/previous "['F5']"

sudo dconf update

