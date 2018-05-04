#!/bin/bash

#Variables
CSCOPE='/usr/bin/cscope'
CTAGS='/usr/bin/ctags'
WORK_DIR=`pwd`
CSDB_MAIN_DIR="$HOME/.csdb"
CSDB_TNUM_FILE="$CSDB_MAIN_DIR/tnum"
EXT_SUPPORT_LIST="c h cpp cxx hpp hxx"

#create cscope database main directory
if [ ! -d "$CSDB_MAIN_DIR" ]; then
    mkdir -p "$CSDB_MAIN_DIR"
fi

#get cscope terminal number
if [ -f "$CSDB_TNUM_FILE" ]; then
   #check if cscope db is already created for this terminal
   if [[ -z "${CSCOPE_TERM}" ]]; then
      CSDB_TNUM=`cat $CSDB_TNUM_FILE`
      CSDB_TNUM=$(expr $CSDB_TNUM + 1)
      echo $CSDB_TNUM > $CSDB_TNUM_FILE
   else
      CSDB_TNUM="${CSCOPE_TERM}"
   fi
else
   CSDB_TNUM=1
   echo $CSDB_TNUM > $CSDB_TNUM_FILE
fi

#create an exclusive cscope folder for the specific terminal
CSDB_DIR_NAME="term$CSDB_TNUM"
CSDB_DIR_PATH="$CSDB_MAIN_DIR/$CSDB_DIR_NAME"
mkdir -p $CSDB_DIR_PATH

#move to the terminal database path
cd $CSDB_DIR_PATH

#get list of source file
INIT_FLAG=1
for EXT in $EXT_SUPPORT_LIST; do
    FIND_CMD="find $WORK_DIR -name \"*.$EXT\""
    if [ "$INIT_FLAG" == 1 ]; then
        find $WORK_DIR -name "*.$EXT" > $CSDB_DIR_PATH/cscope.files
        INIT_FLAG=0
    else
        find $WORK_DIR -name "*.$EXT" >> $CSDB_DIR_PATH/cscope.files
    fi
done

#generate cscope database using cscope.files
$CSCOPE -b -k -q -i $CSDB_DIR_PATH/cscope.files

#generate ctags tagfile
cd $WORK_DIR
$CTAGS -f $CSDB_DIR_PATH/tags -R
cd $CSDB_DIR_PATH

#export/update env variable
export CSCOPE_TERM=$CSDB_TNUM
export CSCOPE_WD=$WORK_DIR
export CSCOPE_DB=$CSDB_DIR_PATH/cscope.out
export CTAGS_FILE=$CSDB_DIR_PATH/tags

#go back to working directory
cd $WORK_DIR
