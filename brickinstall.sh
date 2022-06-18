#!/bin/bash
head -n 9 README
echo "Beginning installation"

echo "Brick: Building project template"
mkdir ./bricktemplate/build ./bricktemplate/tests ./bricktemplate/include
mkdir ./bricktemplate/src ./bricktemplate/src/mains
touch ./bricktemplate/src/mains/target.c
touch ./bricktemplate/Makefile
cat ./brickfiles/target.c > ./bricktemplate/src/mains/target.c
cat ./brickfiles/Makefile > ./bricktemplate/Makefile

echo "Brick: Building .brick directory in template"
mkdir ./bricktemplate/.brick ./bricktemplate/.brick/docs
touch ./bricktemplate/.brick/docs/documentation
cp README ./bricktemplate/.brick
cp README ./brickfiles

echo "Brick: Building stdlib library"
mkdir ./brickstdlib ./brickstdlib/include ./brickstdlib/build

echo "Brick: Moving binaries and libraries into place"
cp brick /usr/local/bin
mkdir /usr/local/lib/brick
cp -r bricktemplate /usr/local/lib/brick
cp -r brickstdlib /usr/local/lib/brick
cp -r brickfiles /usr/local/lib/brick

echo "Brick: Installation complete"
