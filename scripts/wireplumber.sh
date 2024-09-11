#!/bin/bash

cp -r ../config/wireplumber ~/.config
systemctl --user restart pipewire.service

