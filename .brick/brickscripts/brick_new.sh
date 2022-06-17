#!/bin/bash

# check for
if [ $# -lt 1 ];
then
    echo "Brick Error: Missing argument, provide new project name"
    exit 1
fi

# make new project
git clone ... $1

# notify of success
if [ $? -eq 0 ]; then
    echo "New brick project $1 initialized succesfully"
else
    echo "Brick Error: Template project not initialized properly, please investigate"
fi
