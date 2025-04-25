#!/bin/bash

# This script is designed to run a c file on Windows using Git Bash and the gcc compiler.
# If you're running this in a linux environment you need to replace both of the "./a.exe" with "./a.out"

if [ -z $1 ] || [ -z $2 ]; then
    echo "[directory & filename] [action] [flags]";
else
    FILEPATH="$1";
    ACTION="$2";
    FLAGS="$3"

    if [ -f "$FILEPATH" ]; then
        FILENAME="${FILEPATH##*/}";
        DIRECTORY="${FILEPATH%/*}";

        if [ "$DIRECTORY" == "$FILENAME" ]; then
            $ACTION $FILENAME && ./a.out;
        else
            cd $DIRECTORY && $ACTION $FILENAME $FLAGS && ./a.out;
        fi
        echo -e;
    fi
fi