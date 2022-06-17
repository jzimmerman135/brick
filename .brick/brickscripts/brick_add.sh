#!/bin/bash

PROJ_ROOT=.
# check arguments
if [ $# -lt 1 ];
then
    echo "Brick Error: Missing argument, provide new object name"
    exit 1
fi

if [ $1 = 'test' ];
then
    if [ $# -lt 2 ];
    then
        echo "Brick Error: Missing argument, provide new test name"
        exit 1
    fi
    NEWFILE=${2%.*}

    # add the .c file to tests
    touch ${PROJ_ROOT}/tests/${NEWFILE}.c
else
    NEWFILE=${1%.*}

    # add the .c and .h files to src and include
    touch ${PROJ_ROOT}/src/${NEWFILE}.c ${PROJ_ROOT}/include/${NEWFILE}.h

fi

# notify of success
if [ $? -eq 0 ]; then
    echo "New files added succesfully"
else
    echo "Brick Error: Files not added properly, please investigate"
fi
