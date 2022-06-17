#!/usr/bin/env bash

RCFILE=.$(basename $SHELL)rc
COMMENT="# Brick by Jacob Zimmerman"
ALIAS="alias brick=./.brick/brickscripts/brick_startup.sh"

if grep -Fxq "$ALIAS" ~/$RCFILE
then
    echo "Brick Error: Brick is already initialized"
    exit 1
else
    echo "" >> ~/$RCFILE
    echo $COMMENT >> ~/$RCFILE
    echo $ALIAS >> ~/$RCFILE
    $(. ~/$RCFILE)
    echo "Successfully initialized brick"
fi
