#!/bin/bash

dpkg -l "bazelisk" >/dev/null 2>/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://objects.githubusercontent.com/github-production-release-asset-2e65be/149661467/d851681a-5c09-445c-9947-c6846cb84a39?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241115%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241115T192234Z&X-Amz-Expires=300&X-Amz-Signature=73f6ea79e83f1f902bc325d1ee35755975e6ebfd2752caa2caf4495243fee0d2&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dbazelisk-amd64.deb&response-content-type=application%2Foctet-stream" -o bazelisk.deb
    sudo dpkg -i bazelisk.deb
    rm bazelisk.deb
else
    echo "[$0] bazelisk is already installed"
fi

# todo: add driver config automation
