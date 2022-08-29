#!/bin/bash

read -p "Which python version would you like to install? (e.g. python3.10) " python_version

echo "Installing $python_version"
if apt-cache search $python_version | grep $python_version
then
    echo "Installing from apt"
else
    echo "Installing ppa:deadsnakes/ppa"
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
fi

sudo apt install $python_version
echo "Installing pip"
sudo apt install python3-pip

echo "Installing virtualenvwrapper"
sudo $python_version -m pip install virtualenvwrapper

echo "Setting setting virtualenvs directory as $HOME/.virtualenvs"


if echo $SHELL | grep "zsh" 
then
    RC_LOCATION=$HOME/.zshrc
else
    RC_LOCATION=$HOME/.bashrc
fi
echo "export WORKON_HOME=\$HOME/.virtualenvs" >> $RC_LOCATION
echo "export PROJECT_HOME=\$HOME/Devel" >> $RC_LOCATION
echo "export VIRTUALENVWRAPPER_PYTHON=$(which $python_version)" >> $RC_LOCATION
echo "export PATH=/usr/local/bin:\$PATH" >> $RC_LOCATION
source RC_LOCATION
