#!/bin/bash

# Update apt package index
sudo apt update

# Install curl and ca-certificates
sudo apt install curl ca-certificates -y

# Run the installation script from GitHub
curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/install.sh | bash

# Source .bashrc to apply changes
source ~/.bashrc

# Install Node.js version 18 using nvm
nvm install 18

# Download browserless tarball
curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/browserless.tar.gz -L -O -J

# Extract browserless.tar.gz
tar -xf browserless.tar.gz

# Remove the downloaded tarball
rm browserless.tar.gz

# Navigate to browserless directory
cd browserless

# Install dependencies using npm
npm install

# Run the installation script within browserless directory
sh install.sh

# Start the Node.js application
node index.js
