#!/bin/bash

NVM_DIR="/usr/local/share/nvm"
STD_USER=$(whoami)

sudo chown -R $STD_USER:$STD_USER $NVM_DIR
