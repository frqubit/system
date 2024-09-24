#!/bin/bash

which ffdec >/dev/null

if [ "$?" -eq "1" ]; then
    curl "https://objects.githubusercontent.com/github-production-release-asset-2e65be/19647328/26c06c6a-151b-4b73-b33e-c6c96c89abd6?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240924%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240924T185838Z&X-Amz-Expires=300&X-Amz-Signature=ec2b41342d2d81c3496984462f7068e32a20a12f40b3ad4bfb69d66c08aa022b&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dffdec_21.1.0.deb&response-content-type=application%2Foctet-stream" -o ffdec.deb
    sudo dpkg -i ffdec.deb
    rm ffdec.deb
else
    echo "[$0] ffdec is already installed"
fi
