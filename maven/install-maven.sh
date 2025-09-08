#!/bin/sh

# Update the system
sudo apt update -y && sudo apt upgrade -y

# Install apache maven build tool
sudo apt install maven -y

# Check version
mvn --version

