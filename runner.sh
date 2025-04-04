#!/bin/bash

# This script is designed to run a c file on Windows using Git Bash and the gcc compiler.
# If you're running this in a linux environment you need to replace both of the "./a.exe" with "./a.out"

if [ -z $1 ] || [ -z $2 ]; then
    echo "[compiler] [directory & filename]";
else
    COMPILER="$1";
    FILEPATH="$2";

    if [ -f "$FILEPATH" ]; then
        FILENAME="${FILEPATH##*/}";
        DIRECTORY="${FILEPATH%/*}";

        if [ "$DIRECTORY" == "$FILENAME" ]; then
            $COMPILER $FILENAME && ./a.exe;
        else
            cd $DIRECTORY && $COMPILER $FILENAME && ./a.exe;
        fi
    fi
fi