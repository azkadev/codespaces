#! /bin/sh

sudo apt update -y
sudo apt-get install apt-transport-https -y 
mkdir -p $HOME/development
cd $HOME/development
git clone --depth 1 --branch stable https://github.com/flutter/flutter
echo "export PATH=$PATH:$HOME/development/flutter/bin" >> $HOME/.bashrc
source $HOME/.bashrc
flutter doctor

# sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
# sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
# sudo apt update -y
# sudo apt-get install dart -y