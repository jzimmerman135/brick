#!/bin/bash
ARG=$1
SCRIPT_PATH=$(dirname $0)

if [ $ARG = "run" ]
then
    $SCRIPT_PATH/script.sh ${@:2}

elif [ $ARG = "new" ]
then
    $SCRIPT_PATH/brick_new.sh ${@:2}

elif [ $ARG = "make" ]
then
    $SCRIPT_PATH/brick_make.sh ${@:2}

elif [ $ARG = "test" ]
then
    $SCRIPT_PATH/brick_test.sh ${@:2}

elif [ $ARG = "add" ]
then
    $SCRIPT_PATH/brick_add.sh ${@:2}

elif [ $ARG = "init" ]
then
    $SCRIPT_PATH/brick_init.sh ${@:2}


else
    echo "Brick Error: Command not recognized $ARG"
fi
