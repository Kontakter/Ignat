#!/bin/sh -eu

git submodule update --init --recursive

pathogen_path="$HOME/.vim/autoload/pathogen.vim"
rm "$pathogen_path"
mkdir -p ~/.vim/autoload/
curl -L https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim >"$pathogen_path"

path=`pwd`
for x in `find . | egrep -v "\.$" | egrep -v ".*\.git/" | egrep -v ".*\.git$" | egrep -v "init.sh" | egrep -v "Makefile" | egrep -v "you_complete_me"`
do
    if [ -e ~/$x ]; then
        echo "File $x already exists"
    else
        echo "Creating symbolic link to $x"
        ln -s $path/$x ~/$x
    fi
done
