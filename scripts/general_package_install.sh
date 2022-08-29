#!/bin/bash

packages=("gcc" "g++" "gcc-multilib" "curl" "bat" "dpkg" "build-essential")

echo "PACKAGES: ${packages[*]}"
read -p "Would you like to install the above packages? (y/n)" answer

if [ $(echo $answer | tr '[:upper:]' '[:lower:]') == "y" ]
then
    sudo apt-get install -y ${packages[*]}
    echo "Successfuly installed packages!"
fi