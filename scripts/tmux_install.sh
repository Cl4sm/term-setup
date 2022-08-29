#!/bin/bash


echo "Installing tmux perl and sed"
sudo apt-get install -y tmux perl sed


read -p "Would you like to install gpakosz's tmux config? (y/n)" answer

if [ $(echo $answer | tr '[:upper:]' '[:lower:]') == "y" ]
then
    cd $HOME && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
fi
echo "Successfully installed tmux!"