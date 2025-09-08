#!/bin/sh

# Add Jenkins repository and install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# install jenkins
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Note: Make sure to open the port 8080 in the security group

# add user jenkins
sudo adduser jenkins

