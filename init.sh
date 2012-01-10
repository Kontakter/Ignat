#!/bin/sh -e

path=`pwd`
for x in `find . | egrep -v "\.$" | egrep -v "*\.git*"  | egrep -v "init.sh" | egrep -v "Makefile"`
do
    if [ -e ~/$x ]; then
        echo "File $x already exists"
    else
        echo "Creating symbolic link to $x"
        ln -s $path/$x ~/$x
    fi
done
