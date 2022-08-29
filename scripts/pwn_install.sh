#!/bin/bash

read -p "What python version should the pwn venv be?" python_version

echo "Making venv pwn with version $python_version"
mkvirtualenv -p $(which $python_version) pwn

echo "Installing pwntools"
pip install pwntools

echo "Installing one_gadget"
sudo gem install one_gadget

echo "Installing binwalk"
sudo apt install -y binwalk

echo "Installing pwninit"
sudo apt-get install-y libssl-dev lzma-dev
cargo install pwninit

if echo $SHELL | grep "zsh" 
then
    RC_LOCATION=$HOME/.zshrc
else
    RC_LOCATION=$HOME/.bashrc
fi

echo "alias pwninit='pwninit --template-path ~/.config/pwninit-template.py --template-bin-name e'" >> $RC_LOCATION


read -p "Would you like to install qemu system and user?" answer
if [ $(echo $answer | tr '[:upper:]' '[:lower:]') == "y" ]
then
    echo "Installing qemu and qemu-system"
    sudo apt-get install -y qemu qemu-system
fi

echo "Happy pwning :)"