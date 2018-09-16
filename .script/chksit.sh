#!/bin/bash

#Update if docker is installed/build in different path
if [[ $EUID -ne 0 ]]; then
    DOCKERCMD='sudo /usr/bin/docker'
else
    DOCKERCMD='/usr/bin/docker'
fi

#######################################################################
#################### DO NOT EDIT FROM HERE ONWARDS ####################
#######################################################################

$DOCKERCMD ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Networks}}"
