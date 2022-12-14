#!/bin/bash

echo "Installing relevant docker packages"
sudo apt-get install -y ca-certificates  curl  gnupg  lsb-release

echo "Adding official docker GPG key"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing docker"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "Add current user to docker group"
sudo usermod -aG docker $USER

echo "Docker successfully installed! (You'll need to logout and back in to apply group change)"