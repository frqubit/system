#!/bin/bash

curl "https://nnenix.mm.fcix.net/kdeftp/stable/krita/5.2.3/krita-5.2.3-x86_64.appimage" -o krita
chmod +x ./krita
chown root:root ./krita
mv ./krita /usr/local/bin
