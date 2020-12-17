#!/bin/bash

#Image to use
IMAGE_REPO='excelforejp.com:4560/xl4-ghs-build-env'
#IMAGE_TAG='716.202014'
#IMAGE_TAG='716.202014.NXP.S32-dtb-allan'
#IMAGE_TAG='716.202014.19011-allan'
#IMAGE_TAG='716.202014.S32G-v0.5-build-allan'
#IMAGE_TAG='716.202014.NXP.S32.v0.4-xl4jp-build-patched'
#IMAGE_TAG='716.202014.S32G-v0.6-allan'
IMAGE_TAG='716.202014.S32G-v0.6-allan-work'
#IMAGE_TAG='716.202014.S32G-v0.6'

#Container/Host name prefix
NAME_PREFIX='xl4-ghs-build-env'

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
    -e GHS_LMHOST=excelforejp.com \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    --group-add audio --device /dev/snd \
    -v $HOME/workspace:$HOME/workspace \
    -v $HOME/.Xauthority:$HOME/.Xauthority \
    -v $HOME/.ssh:$HOME/.ssh \
    $IMAGE_REPO:$IMAGE_TAG
#    --name ${DEV_ENV_NAME} --hostname "${DEV_ENV_NAME}" \
#    -v $HOME/workspace:/home/xl4jp/workspace \
#    -v $HOME/.Xauthority:/home/xl4jp/.Xauthority \
#    -v $HOME/.ssh:/home/xl4jp/.ssh \
#
#    -v $HOME/workspace:/root/workspace \
#    -v $HOME/.Xauthority:/root/.Xauthority \
#
