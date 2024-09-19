#!/bin/bash

chmod +x linux/scripts/*.sh

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "REPO_DIR = $REPO_DIR"

# Process extras
EXTRAS_FILE=$(mktemp)

pgrep spotify &> /dev/null

if [ "$?" -eq 0 ]; then
    # spotify is running

    echo "restart_spotify" >> $EXTRAS_FILE
fi

echo ""
echo "#########################"
echo "# EXTRAS_FILE"
echo "#########################"
echo ""

cat $EXTRAS_FILE

cat linux/scripts/usermap | while read line; do
    shell_name=linux/scripts/$(echo $line | awk '{print $1;}')
    user=$(echo $line | awk '{print $2;}')

    if [[ "$shell_name" == "linux/scripts/#" ]]; then
        echo "skipping $user"
    else
        export REPO_DIR

        if [[ "$user" == "root" ]]; then
            echo ""
            echo "#########################"
            echo "# (ROOT) $shell_name"
            echo "#########################"
            echo ""

            sudo REPO_DIR=$REPO_DIR EXTRAS_FILE=$EXTRAS_FILE $shell_name

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

            REPO_DIR=$REPO_DIR EXTRAS_FILE=$EXTRAS_FILE $shell_name

            if [ "$?" -ne "0" ]; then
                echo "Failed script: [$shell_name]"
                exit 1
            fi
        fi
    fi
done

grep -Fxq "restart_spotify" $EXTRAS_FILE
if [ "$?" -eq "0" ]; then
    gtk-launch spotify
fi

echo "Make sure to reset your bash environment."
