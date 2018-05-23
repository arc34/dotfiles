#!/bin/bash

#Update if docker is installed/build in different path
DOCKERCMD='sudo /usr/bin/docker'

#######################################################################
#################### DO NOT EDIT FROM HERE ONWARDS ####################
#######################################################################

$DOCKERCMD ps -a --format "table {{.Names}}\t{{.Command}}\t{{.Status}}\t{{.Networks}}"
