#!/bin/bash

#Update if docker is installed/build in different path
DOCKERCMD='sudo /usr/bin/docker'

#######################################################################
#################### DO NOT EDIT FROM HERE ONWARDS ####################
#######################################################################

if [ -n "$1" ]; then
    if [ "$1" == "lcp0" ]; then
        $DOCKERCMD start lcp0
    elif [ "$1" == "lsp00" ]; then
        $DOCKERCMD start lsp00
    elif [ "$1" == "lsp14" ]; then
        $DOCKERCMD start lsp14
    else
        echo "Card Type $1 not supported"
        echo "USAGE: rstsit <lcp0/lsp00/lsp14>"
    fi
else
    echo "USAGE: rstsit <lcp0/lsp00/lsp14>"
fi
