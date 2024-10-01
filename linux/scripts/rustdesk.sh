#!/bin/bash

LATEST_VERSION="1.3.1"

LATEST_URL="https://objects.githubusercontent.com/github-production-release-asset-2e65be/299354207/92c7a82d-4870-49fd-9a01-2efffac2e96c?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241001%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241001T162822Z&X-Amz-Expires=300&X-Amz-Signature=dc896aae80fe03766af3ab1d9812e98a2e2a4ad89359a64a92dc61d0d9eb1915&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Drustdesk-1.3.1-x86_64.deb&response-content-type=application%2Foctet-stream"

install_rustdesk() {
    curl "$LATEST_URL" -o rustdesk.deb

    sudo apt-get install libxdo3
    sudo dpkg -i rustdesk.deb
    rm rustdesk.deb
}

which rustdesk >/dev/null

if [ "$?" -eq "1" ]; then
    # Discord is not installed
    install_rustdesk
else
    echo "[$0] rustdesk is already installed"
    echo "[$0] checking for updates..."

    rustdesk_version=$(dpkg -s rustdesk | grep '^Version:' | awk '{print $2}')

    if [[ ! "$rustdesk_version" == "$LATEST_VERSION" ]]; then
        echo "[$0] updating rustdesk..."

        install_rustdesk
    else
        echo "[$0] rustdesk is up to date!"
    fi
fi
