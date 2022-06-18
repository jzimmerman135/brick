#!/bin/bash

# build template
mkdir ./bricktemplate/build ./bricktemplate/tests ./bricktemplate/include
mkdir ./bricktemplate/src ./bricktemplate/src/mains
mv ./bricktemplate/target.c ./bricktemplate/src/mains/target.c

# build .brick directory in template
mkdir ./bricktemplate/.brick ./bricktemplate/.brick/documentation
cp README ./bricktemplate/.brick
cp README ./brickmessages

# build stdlib linking library
mkdir ./brickstdlib ./brickstdlib/include ./brickstdlib/build

# move stuff deep down
cp brick /usr/local/bin
mkdir /usr/local/lib/brick
cp -r bricktemplate /usr/local/lib/brick
cp -r brickstdlib /usr/local/lib/brick
cp -r brickmessages /usr/local/lib/brick
