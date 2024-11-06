#!/bin/bash

if [ ! -f /etc/apt/sources.list.d/virtualbox.list ]; then
    # firefox key
    wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list > /dev/null
else
    echo "[$0] virtualbox key is already imported"
fi

apt-get update
apt-get install virtualbox-7.1 -y
