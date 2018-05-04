#!/bin/bash

SOURCE_REPO=$1
WORK_DIR=`pwd`
DIRLIST_PATH="$HOME/.temp"
DIRLIST_NAME="dirlist"

if [ -n "$SOURCE_REPO" ]; then
    # create .temp folder in your home directory if not yet available
    mkdir -p $DIRLIST_PATH

    #enter source repo and get list of empty directories
    cd $SOURCE_REPO
    find . -type d ! -path "*.git*" -empty | grep -v .svn > $DIRLIST_PATH/$DIRLIST_NAME

    #generate empty folders from current working directory
    cd $WORK_DIR
    xargs -d '\n' mkdir -p -- < $DIRLIST_PATH/$DIRLIST_NAME
else
    echo "USAGE: cedir <SOURCE REPO>"
fi
