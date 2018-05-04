#!/bin/bash
CFG_REG_TEST_FILE=$HOME/.test_resource/cfg_registers

if [ -n "$FAPROOT" ]; then
    #enter FAPROOT
    cd $FAPROOT

    #find and replace cfg_registers with the test version
    CFG_REG_COUNT=`find . -name "cfg_registers" | wc -l`
    CFG_REG_FILE=`find . -name "cfg_registers"`
    CFG_REG_PATH=$(dirname "${CFG_REG_FILE}")

    if [ "$CFG_REG_COUNT" -eq "1" ]; then
        #change CFG register
        \rm $CFG_REG_FILE
        cp $CFG_REG_TEST_FILE $CFG_REG_PATH

        #change CPU ID
        sed -i "s/coreNo\t= MW_CPU4_ID/coreNo\t= MW_CPU1_ID/" cpMw/common/init/core/src/cpMwInit_oampf.c
        sed -i "s/\tMW_CPU4_ID,\t/\tMW_CPU1_ID,\t/" cpMw/common/intfLib/s1X2Mgr/src/cpMwS1X2Intf_oampf.c
    else
        echo "invalid cfg_registers count ($CFG_REG_COUNT)"
        echo "confirm that FAPROOT is correct"
    fi
else
    echo "please define FAPROOT first"
fi
