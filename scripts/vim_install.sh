#!/bin/bash

sudo apt-get install -y vim
read -p "Would you like to install amix's vim config? (y/n)" answer

if [ $(echo $answer | tr '[:upper:]' '[:lower:]') == "y" ]
then
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    $SHELL ~/.vim_runtime/install_awesome_vimrc.sh
fi