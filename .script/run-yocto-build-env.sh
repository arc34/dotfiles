#!/bin/bash

#Image to use
IMAGE_REPO='excelforejp.com:4560/yocto-build-env'
IMAGE_TAG='latest'

#######################################################################
#################### DO NOT EDIT FROM HERE ONWARDS ####################
#######################################################################

DOCKERCMD=$(command -v docker 2>/dev/null)
if ! [[ -x ${DOCKERCMD} ]]; then
    echo 'Error: docker is not installed.' >&2
    exit 1
fi

DEV_ENV_LIST=$(docker ps --format "{{.Names}}" | grep yocto-build-env | sort -V)

DEV_ENV_NUM=0
for DEV_ENV in ${DEV_ENV_LIST}; do
    DEV_ENV_PREFIX=${DEV_ENV//[!0-9]/}
    if [ ${DEV_ENV_NUM} != ${DEV_ENV_PREFIX} ]; then
        break
    fi
    ((DEV_ENV_NUM++))
done

DEV_ENV_NAME="yocto-build-env-${DEV_ENV_NUM}"

$DOCKERCMD run --rm -it \
    --privileged \
    --name ${DEV_ENV_NAME} --hostname "${DEV_ENV_NAME}" \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    --group-add audio --device /dev/snd \
    -v $HOME/workspace:/home/xl4/workspace \
    -v $HOME/.ssh:/home/xl4/.ssh \
    -v /opt/yocto:/opt/yocto \
    $IMAGE_REPO:$IMAGE_TAG
