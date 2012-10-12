#!/bin/sh -eu

git submodule init && git submodule update

if [ ! -d "/home/ignat/.vim/autoload" ]; then
    mkdir ~/.vim/autoload
    curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

path=`pwd`
for x in `find . | egrep -v "\.$" | egrep -v "*\.git/" | egrep -v "*\.git$"  | egrep -v "init.sh" | egrep -v "Makefile"`
do
    if [ -e ~/$x ]; then
        echo "File $x already exists"
    else
        echo "Creating symbolic link to $x"
        ln -s $path/$x ~/$x
    fi
done
