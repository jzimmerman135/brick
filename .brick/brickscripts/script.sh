#!/bin/bash

echo hello
RCFILE=$(basename $SHELL)rc
echo $RCFILE
echo $(dirname "$0")
