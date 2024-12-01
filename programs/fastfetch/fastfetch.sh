#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.30.1/fastfetch-linux-amd64.deb && sudo apt install "$PWD/fastfetch-linux-amd64.deb" -y