#!/bin/bash

#Variables
LOCAL_REPO_PATH='/media/sf_repository/GIT/hdbde_eNBCNT'
DEFAULT_SEP_PATH='oamMw/common/startup/tst/fwImages/SDATA_HD18A171302_R3_P_S000.SEP'

if [ -n "$FAPROOT" ]; then
    #enter FAPROOT
    cd $FAPROOT
    cp -rf $LOCAL_REPO_PATH/build .
    cp $LOCAL_REPO_PATH/$DEFAULT_SEP_PATH $DEFAULT_SEP_PATH
else
    echo "please define FAPROOT first"
fi
