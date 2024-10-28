#!/bin/bash

which code >/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://vscode.download.prss.microsoft.com/dbazure/download/stable/384ff7382de624fb94dbaf6da11977bba1ecd427/code_1.94.2-1728494015_amd64.deb" -o vscode.deb
    sudo dpkg -i vscode.deb
    rm vscode.deb
else
    echo "[$0] vscode is already installed"
fi
