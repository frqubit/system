#!/bin/bash

curl "https://download.virtualbox.org/virtualbox/7.0.20/virtualbox-7.0_7.0.20-163906~Debian~bookworm_amd64.deb" -o virtualbox.deb
sudo dpkg -i virtualbox.deb
rm virtualbox.deb
