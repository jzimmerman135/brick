#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please use sudo ./brickuninstall"
  exit 1
fi

rm -rf bricktemplate
rm -rf brickstdlib
rm /usr/local/bin/brick
rm -rf /usr/local/lib/brick
echo "Uninstalled brick"
