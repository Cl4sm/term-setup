#!/bin/bash

echo "Installing angr-dev"

sudo apt-get install -y libgcc-10-dev
cd $HOME && git clone https://github.com/angr/angr-dev.git
cd $HOME/angr-dev && ./setup.sh -i -e angr

echo "Successfully installed angr-dev!"