#!/bin/bash
if [ -n "$FAPROOT" ]; then
    #Variables
    UTROOT="$FAPROOT/tests/ut"

    #reconfigure cpputest make files
    cd $UTROOT/common/cpputest && autoreconf

    #reconfigure cpputest make files
    cd $UTROOT

    #execute utcimake.sh
    ./utcimake.sh oampf
    ./utcimake.sh valgrind

    #collect valgrind logs
    tar -czf valgrind_logs.tar.gz valgrindLogs/*
else
    echo "please define FAPROOT first"
fi
