#!/bin/bash

dpkg -l "huiontablet" >/dev/null 2>/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://driverdl.huion.com/driver/Linux/HuionTablet_LinuxDriver_v15.0.0.162.x86_64.deb" -o huion_driver.deb
    sudo dpkg -i huion_driver.deb
    rm huion_driver.deb
else
    echo "[$0] huiontablet is already installed"
fi

# todo: add driver config automation
