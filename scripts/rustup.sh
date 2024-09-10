#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mv ~/.cargo /usr/local/cargo
chown cski:cski /usr/local/cargo

