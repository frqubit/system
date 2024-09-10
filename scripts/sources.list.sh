#!/bin/bash

cp ../config/001_sources.list /etc/apt/sources.list
apt-get update

apt install fasttrack-archive-keyring

cp ../config/002_sources.list /etc/apt/sources.list
apt-get update

