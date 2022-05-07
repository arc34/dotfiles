#!/bin/bash

#Image to use
IMAGE_REPO='excelforejp.com:5050/xl4tsn/stpl/xl4stpl-build-env'
IMAGE_TAG='allan'

#######################################################################
#################### DO NOT EDIT FROM HERE ONWARDS ####################
#######################################################################

DOCKERCMD=$(command -v docker 2>/dev/null)
if ! [[ -x ${DOCKERCMD} ]]; then
    echo 'Error: docker is not installed.' >&2
    exit 1
fi

DEV_ENV_LIST=$(docker ps --format "{{.Names}}" | grep stpl-dev-env | sort -V)

DEV_ENV_NUM=0
for DEV_ENV in ${DEV_ENV_LIST}; do
    DEV_ENV_PREFIX=${DEV_ENV//[!0-9]/}
    if [ ${DEV_ENV_NUM} != ${DEV_ENV_PREFIX} ]; then
        break
    fi
    ((DEV_ENV_NUM++))
done

DEV_ENV_NAME="stpl-dev-env-${DEV_ENV_NUM}"

$DOCKERCMD run --rm -it \
    --privileged \
    --net host \
    --name ${DEV_ENV_NAME} --hostname "$(hostname)" \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    --group-add audio --device /dev/snd \
    -e DEB_BUILD_OPTIONS=nocheck \
    -e DPKG_BUILDP_EXTPARAS=--no-lintian \
    -e DEBUILD_EXTPARAS=-r\""sudo -E"\" \
    -e DEB_SUDO=sudo \
    -w ${PWD} \
    -v $HOME/.config/nvim:$HOME/.config/nvim \
    -v $HOME/.local/share/nvim:$HOME/.local/share/nvim \
    -v $HOME/workspace:$HOME/workspace \
    -v $HOME/.ssh:$HOME/.ssh \
    $IMAGE_REPO:$IMAGE_TAG
#    --network=STPL_NET \
#    --name ${DEV_ENV_NAME} --hostname "${DEV_ENV_NAME}" \
