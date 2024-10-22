#!/bin/sh

sudo apt update -y
sudo apt-get install apt-transport-https -y 

mkdir -p "$HOME/development"
cd "$HOME/development"
git clone --depth 1 --branch stable https://github.com/flutter/flutter
echo "git config --global --add safe.directory \$HOME/development/flutter" >> $HOME/.bashrc
echo "export PATH=\$PATH:\$HOME/development/flutter/bin" >> $HOME/.bashrc
echo "export PATH=\$PATH:\$HOME/development/flutter/bin" >> $HOME/.zshrc

source $HOME/.bashrc
source $HOME/.zshrc
flutter doctor

flutter config --enable-web
flutter config --enable-linux-desktop
flutter config --enable-macos-desktop
flutter config --enable-windows-desktop
flutter config --no-analytics