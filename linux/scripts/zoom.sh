#!/bin/bash

dpkg -l "zoom" >/dev/null 2>/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://cdn.zoom.us/prod/6.2.10.4983/zoom_amd64.deb" -o zoom.deb
    sudo dpkg -i zoom.deb
    rm zoom.deb
else
    echo "[$0] zoom is already installed"
fi

# todo: add driver config automation
