#!/bin/bash


echo "Install gdb..."
sudo apt-get install -y gdb gdbserver gdb-multiarch

read -p "Would you like to install GEF for GDB? (y/n)" answer
if [ $(echo $answer | tr '[:upper:]' '[:lower:]') == "y" ]
then
    bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
fi

echo "Successfully installed GDB!"