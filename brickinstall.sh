#!/bin/bash

# Brick by Jacob Zimmerman
# In the interest of safety I will document this code carefully to show
# that there is nothing malicious

# Requires Superuser to change /usr/local/
if [ "$EUID" -ne 0 ]; then
    echo "Please use sudo ./brickuninstall"
    exit 1
fi

# Show the brick title ascii art
head -n 9 README

echo "Beginning installation:"

echo "Brick: Building project template"
# make bricktemplate with tests include src src/mains and build subdirectories
mkdir bricktemplate
mkdir ./bricktemplate/build ./bricktemplate/tests ./bricktemplate/include
mkdir ./bricktemplate/src ./bricktemplate/src/mains

# make copy of target.c and Makefile in template
# inspect them in brickfiles directory
cp ./brickfiles/target.c ./bricktemplate/src/mains/target.c
cp ./brickfiles/Makefile ./bricktemplate/Makefile

echo "Brick: Building .brick directory in template"

# make empty .brick and docs folder
# add empty file to documentation folder
mkdir ./bricktemplate/.brick ./bricktemplate/.brick/docs
touch ./bricktemplate/.brick/docs/documentation

# move the README to files and to project template
cp README ./bricktemplate/.brick
mv README ./brickfiles

echo "Brick: Building stdlib library"

# build an empty stdlib placeholder directory
mkdir brickstdlib
mkdir ./brickstdlib/include ./brickstdlib/lib

echo "Brick: Moving binaries and libraries into place"

# move the brick binary to /usr/loca/bin
cp brick /usr/local/bin

# move the folders created above to /usr/local/lib
mkdir -p /usr/local/lib/brick
cp -r bricktemplate /usr/local/lib/brick
cp -r brickstdlib /usr/local/lib/brick
cp -r brickfiles /usr/local/lib/brick

echo "Brick: Cleaning up"

# clean up the template and stdlib placeholder directories,
rm -rf bricktemplate
rm -rf brickstdlib
# move README back
mv ./brickfiles/README README

echo "Brick: Installation complete"
