#!/bin/sh

sudo apt update -y
sudo apt-get install apt-transport-https -y 
mkdir -p $HOME/development
cd $HOME/development
git clone --depth 1 --branch stable https://github.com/flutter/flutter
echo "export PATH=$PATH:$HOME/development/flutter/bin" >> $HOME/.bashrc
echo "export PATH=$PATH:$HOME/development/flutter/bin" >> $HOME/.zshrc
source $HOME/.bashrc
flutter doctor
 