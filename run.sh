#!/bin/sh

if [ -z $1 ]; then
    echo 'No project specified! Please choose a project to run!' >&2
    exit 1
fi

PROJECT=`ls -d */ | grep -e "$1" | head -n 1`

if [ -z $PROJECT ]; then
    echo "No directory found matching pattern '$1'!"
    exit 1
fi

cd "$PROJECT"
mewlix run
