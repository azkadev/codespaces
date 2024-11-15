#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y
wget https://mega.nz/linux/repo/xUbuntu_20.04/amd64/megacmd-xUbuntu_20.04_amd64.deb && sudo apt install "$PWD/megacmd-xUbuntu_20.04_amd64.deb" -y