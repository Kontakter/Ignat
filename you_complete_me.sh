#!/bin/bash -eux

# Install vim47
echo "deb http://ppa.launchpad.net/fcwu-tw/ppa/ubuntu precise main\n"\
     "deb-src http://ppa.launchpad.net/fcwu-tw/ppa/ubuntu precise main" > /etc/apt/sources.list.d/fcwu-tw.list
apt-get update
apt-get install vim

# Install YouCompleteMe with vim-vundle
vim +BundleInstall +qall

# Compile with clang support
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

# Do not forget to create ~/.ycm_extra_conf.py (https://github.com/Valloric/YouCompleteMe/blob/master/cpp/ycm/.ycm_extra_conf.py)
