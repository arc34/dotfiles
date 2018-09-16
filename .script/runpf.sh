#!/bin/bash

#Update if docker is installed/build in different path
if [[ $EUID -ne 0 ]]; then
    DOCKERCMD='sudo /usr/bin/docker'
else
    DOCKERCMD='/usr/bin/docker'
fi

#Define name of network to be used by the containers
SIT_NET='SIT_NET'

#Define path for each containers workspace
HOST_WORKSPACE_PATH='/home/allan/workspace'
WORKSPACE_LCP0="$HOST_WORKSPACE_PATH/LCP0"
WORKSPACE_LSP00="$HOST_WORKSPACE_PATH/LSP00"
WORKSPACE_LSP14="$HOST_WORKSPACE_PATH/LSP14"

#[For Virtual Box user's] Define shared folder path of windows host
WIN_HOST_SF_PATH='/media/sf_repository'

#Image to use
IMAGE_REPO='archive.docker-registry.eecloud.nsn-net.net/allco/fedora'
IMAGE_TAG='hdbde-systemd-pf'

#######################################################################
#################### DO NOT EDIT FROM HERE ONWARDS ####################
#######################################################################

if [ -n "$1" ]; then
    NET_INSPECT_OUT=`$DOCKERCMD network inspect $SIT_NET`

    if [ "$NET_INSPECT_OUT" == "[]" ]; then
        echo "Docker Network $SIT_NET not found, please setup it first"
	echo ""
	echo "Sample Command:"
        echo " docker network create -d macvlan --subnet=192.168.129.0/24 --gateway 192.168.129.1 -o parent=eth0 $SIT_NET"
	echo ""
	exit 1
    fi

    if [ "$1" == "lcp0" ]; then
        $DOCKERCMD run -d --name lcp0 --hostname "lcp0" --network=$SIT_NET --ip 192.168.129.101 \
                   --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
                   -v $WORKSPACE_LCP0:/root/workspace \
                   -v $WIN_HOST_SF_PATH:$WIN_HOST_SF_PATH \
                   -v /lib/modules:/lib/modules \
                   -v /usr/src/kernels:/usr/src/kernels \
                   --shm-size="1gb" --cap-add=ALL --privileged $IMAGE_REPO:$IMAGE_TAG
    elif [ "$1" == "lsp00" ]; then
        $DOCKERCMD run -d --name lsp00 --hostname "lsp00" --network=$SIT_NET --ip 192.168.129.102 \
                   --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
                   -v $WORKSPACE_LSP00:/root/workspace \
                   -v $WIN_HOST_SF_PATH:$WIN_HOST_SF_PATH \
                   -v /lib/modules:/lib/modules \
                   -v /usr/src/kernels:/usr/src/kernels \
                   --shm-size="1gb" --cap-add=ALL --privileged $IMAGE_REPO:$IMAGE_TAG
    elif [ "$1" == "lsp14" ]; then
        $DOCKERCMD run -d --name lsp14 --hostname "lsp14" --network=$SIT_NET --ip 192.168.129.110 \
                   --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
                   -v $WORKSPACE_LSP14:/root/workspace \
                   -v $WIN_HOST_SF_PATH:$WIN_HOST_SF_PATH \
                   -v /lib/modules:/lib/modules \
                   -v /usr/src/kernels:/usr/src/kernels \
                   --shm-size="1gb" --cap-add=ALL --privileged $IMAGE_REPO:$IMAGE_TAG
    else
        echo "Card Type $1 not supported"
        echo "USAGE: runpf <lcp0/lsp00/lsp14>"
    fi
else
    echo "USAGE: runpf <lcp0/lsp00/lsp14>"
fi
