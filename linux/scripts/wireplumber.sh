#!/bin/bash

if [ -z ${REPO_DIR+x} ]; then
    echo "[$0] this script requires a \$REPO_DIR variable but it wasn't set. the script was shut down for your system's safety."
    exit 1
fi

if [ -z ${EXTRAS_FILE+x} ]; then
    echo "[$0] this script requires a \$EXTRAS_FILE variable but it wasn't set. the script was shut down for your system's safety."
    exit 1
fi

cp -r $REPO_DIR/config/wireplumber ~/.config

grep -Fxq "restart_spotify" $EXTRAS_FILE
if [ "$?" -eq "0" ]; then
    # it's going to need to be restarted anyway
    pkill spotify
fi

systemctl --user restart pipewire.service
