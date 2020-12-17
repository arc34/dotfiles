#!/bin/bash

#Image to use
IMAGE_REPO='excelforejp.com:4560/esync-runner'
IMAGE_TAG='develop'

#Container/Host name prefix
NAME_PREFIX='esync-runner'

#######################################################################
#################### DO NOT EDIT FROM HERE ONWARDS ####################
#######################################################################

DOCKERCMD=$(command -v docker 2>/dev/null)
if ! [[ -x ${DOCKERCMD} ]]; then
    echo 'Error: docker is not installed.' >&2
    exit 1
fi

DEV_ENV_LIST=$(docker ps --format "{{.Names}}" | grep ${NAME_PREFIX} | sort -V)

DEV_ENV_NUM=0
for DEV_ENV in ${DEV_ENV_LIST}; do
    DEV_ENV_NUM_SUFFIX=${DEV_ENV#"${NAME_PREFIX}-"}
    if [ ${DEV_ENV_NUM} != ${DEV_ENV_NUM_SUFFIX} ]; then
        break
    fi
    ((DEV_ENV_NUM++))
done

DEV_ENV_NAME="${NAME_PREFIX}-${DEV_ENV_NUM}"

$DOCKERCMD run --rm -it \
    --privileged \
    --net host \
    --name ${DEV_ENV_NAME} --hostname "$(hostname)" \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    --group-add audio --device /dev/snd \
    -v $HOME/workspace:$HOME/workspace \
    -v $HOME/.Xauthority:$HOME/.Xauthority \
    -v $HOME/.ssh:$HOME/.ssh \
    $IMAGE_REPO:$IMAGE_TAG
