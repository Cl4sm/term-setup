#!/bin/bash

sudo apt-get install -y zsh

#Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Change theme to af-magic
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="af-magic"/g' ~/.zshrc
echo "alias bat='batcat'" >> ~/.zshrc

zsh -c source ~/.zshrc
