#!/bin/bash

# build template
mkdir ./bricktemplate/build ./bricktemplate/tests ./bricktemplate/include
mkdir ./bricktemplate/src ./bricktemplate/src/mains
mv ./bricktemplate/target.c ./bricktemplate/src/mains/target.c

# build stdlib linking library
mkdir ./brickstdlib ./brickstdlib/include ./brickstdlib/build

# move stuff deep down
sudo cp brick /usr/local/bin
sudo mkdir /usr/local/lib/brick
sudo cp -r bricktemplate /usr/local/lib/brick
sudo cp -r brickstdlib /usr/local/lib/brick
sudo cp -r brickmessages /usr/local/lib/brick
