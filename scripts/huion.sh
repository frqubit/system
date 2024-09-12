#!/bin/bash

curl "https://driverdl.huion.com/driver/Linux/HuionTablet_LinuxDriver_v15.0.0.162.x86_64.deb" -o huion_driver.deb
sudo dpkg -i huion_driver.deb
rm huion_driver.deb

# todo: add driver config automation
