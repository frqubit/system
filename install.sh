#!/bin/bash

arg0=$0

help_msg() {
    echo "$arg0 - set up a linux debian system"
    echo " "
    echo "$arg0 [options]"
    echo " "
    echo "options:"
    echo "-h, --help             show brief help"
    echo "--update               only update, do not install stuff"
    echo "--gaming               install gaming stuff, optional for less bloated device"
    exit 0
}

chmod +x linux/scripts/*.sh

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/linux
echo "REPO_DIR = $REPO_DIR"

# Process extras
EXTRAS_FILE=$(mktemp)

# Process flags
while test $# -gt 0; do
    case $1 in
        -h|--help)
            help_msg
            exit 0
            ;;
        --update)
            shift
            echo "update_only" >> $EXTRAS_FILE
            ;;
        --gaming)
            shift
            echo "gaming" >> $EXTRAS_FILE
            ;;
        -*)
            break
            ;;
    esac
done

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
    shell_name=$(echo $line | awk '{print $1;}')

    if [[ "$shell_name" == "#" ]]; then
        echo "skipping $user"
    else
        shell_name=linux/scripts/$shell_name
        user=$(echo $line | awk '{print $2;}')

        specs=$(echo $line | cut -d" " -f3-)
        specs=($specs)

        actually_run=1

        for spec in "${specs[@]}"; do
            if [[ $spec == '!'* ]]; then
                spec="${spec:1}"

                grep -Fxq $spec $EXTRAS_FILE
                if [ "$?" -eq "0" ]; then
                    echo "[$shell_name] Cannot run this: $spec exists"

                    actually_run=0
                    break
                fi
            else
                grep -Fxq $spec $EXTRAS_FILE
                if [ "$?" -ne "0" ]; then
                    echo "[$shell_name] Cannot run this: $spec does not exist"

                    actually_run=0
                    break
                fi
            fi
        done

        if [ "$actually_run" -eq "1" ]; then
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
    fi
done

grep -Fxq "restart_spotify" $EXTRAS_FILE
if [ "$?" -eq "0" ]; then
    gtk-launch spotify
fi

echo "Make sure to reset your bash environment."
