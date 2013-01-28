#!/bin/sh -eu

git submodule init && git submodule update

pathogen_path="~/.vim/autoload/pathogen.vim"
if [ ! -e "$pathogen_path" ]; then
    mkdir -p ~/.vim/autoload/
    curl https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim >"$pathogen_path"
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
