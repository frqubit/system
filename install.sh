#!/bin/bash

chmod +x scripts/*.sh

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "REPO_DIR = $REPO_DIR"

cat scripts/usermap | while read line; do
    shell_name=scripts/$(echo $line | awk '{print $1;}')
    user=$(echo $line | awk '{print $2;}')

    if [[ "$shell_name" == "scripts/#" ]]; then
        echo "skipping $user"
    else
        export REPO_DIR

        if [[ "$user" == "root" ]]; then
            echo ""
            echo "#########################"
            echo "# (ROOT) $shell_name"
            echo "#########################"
            echo ""

            sudo REPO_DIR=$REPO_DIR $shell_name

            if [ "$?" -ne "0" ]; then
                echo "Failed script: [$shell_name]"
                exit 1
            fi
        else
            echo ""
            echo "#########################"
            echo "# $shell_name"
            echo "#########################"
            echo ""

            $shell_name

            if [ "$?" -ne "0" ]; then
                echo "Failed script: [$shell_name]"
                exit 1
            fi
        fi
    fi
done

echo "Make sure to reset your bash environment."
