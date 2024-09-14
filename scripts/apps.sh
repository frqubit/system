#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "[$0] this script requires root"
    exit 1
fi

if [ -z ${REPO_DIR+x} ]; then
    echo "[$0] this script requires a \$REPO_DIR variable but it wasn't set. the script was shut down for your system's safety."
    exit 1
fi

USR_SHARE_DIR=/usr/local/share/mysystem

if [ -d $USR_SHARE_DIR ]; then
    rm -rf $USR_SHARE_DIR
    rm /usr/share/applications/kill_discord.desktop
fi

mkdir -p $USR_SHARE_DIR
cp -r $REPO_DIR/config/apps $USR_SHARE_DIR/apps
mv $USR_SHARE_DIR/apps/icons $USR_SHARE_DIR/icons

chmod +x $USR_SHARE_DIR/apps/*.desktop $USR_SHARE_DIR/apps/*.sh

for desktop in $(find $USR_SHARE_DIR/apps -type f -name *.desktop); do
    ln -s $desktop "/usr/share/applications/$(basename $desktop)"
done

update-desktop-database
