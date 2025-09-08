#!/bin/sh

# Update your system
sudo apt update -y && sudo apt upgrade -y

# install docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Add the current user to the docker group (to run docker without sudo)
sudo usermod -aG docker "$USER"
