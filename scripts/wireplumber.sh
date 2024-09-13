#!/bin/bash

if [ -z ${REPO_DIR+x} ]; then
    echo "[$0] this script requires a \$REPO_DIR variable but it wasn't set. the script was shut down for your system's safety."
    exit 1
fi

cp -r $REPO_DIR/config/wireplumber ~/.config
systemctl --user restart pipewire.service
