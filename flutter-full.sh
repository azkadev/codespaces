#!/bin/sh

echo "started install flutter and android sdk"

mkdir -p $HOME/Android/Sdk/
mkdir -p $HOME/development/
echo "\n" >> ~/.bashrc

export DEBIAN_FRONTEND=noninteractive

export ANDROID_SDK="$HOME/Android/Sdk/"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk/" 
export ANDROID_HOME="$HOME/Android/Sdk/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/"
export PATH="$PATH:$ANDROID_HOME/emulator/" 
export PATH="$PATH:$ANDROID_HOME/platform-tools/"
export PATH="$PATH:$ANDROID_SDK"
export PATH="$PATH:$HOME/development/flutter/bin"

cat << 'EOF' >> ~/.bashrc
export ANDROID_SDK="$HOME/Android/Sdk/"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk/" 
export ANDROID_HOME="$HOME/Android/Sdk/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/"
export PATH="$PATH:$ANDROID_HOME/emulator/" 
export PATH="$PATH:$ANDROID_HOME/platform-tools/"
export PATH="$PATH:$ANDROID_SDK"
export PATH="$PATH:$HOME/development/flutter/bin"
EOF


cat << 'EOF' >> ~/.zshrc
export ANDROID_SDK="$HOME/Android/Sdk/"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk/" 
export ANDROID_HOME="$HOME/Android/Sdk/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/"
export PATH="$PATH:$ANDROID_HOME/emulator/" 
export PATH="$PATH:$ANDROID_HOME/platform-tools/"
export PATH="$PATH:$ANDROID_SDK"
export PATH="$PATH:$HOME/development/flutter/bin"
EOF


sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    wget \
    curl \
    make \
    git \
    zlib1g-dev \
    libssl-dev \
    gperf \
    cmake \
    clang \
    libc++-dev \
    libc++abi-dev \
    php-cli \
    g++ \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    xz-utils \
    unzip \
    xvfb \
    openjdk-17-jdk

mkdir -p $HOME/Android/Sdk/cmdline-tools
wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O /tmp/tools.zip
unzip -q /tmp/tools.zip -d $HOME/Android/Sdk/cmdline-tools
sudo cp -rf $HOME/Android/Sdk/cmdline-tools/cmdline-tools $HOME/Android/Sdk/cmdline-tools/latest 

yes "y" | sdkmanager
yes "y" | sdkmanager --update
yes "y" | sdkmanager "build-tools;33.0.1"
yes "y" | sdkmanager "build-tools;34.0.0"
yes "y" | sdkmanager "cmake;3.18.1"
yes "y" | sdkmanager "ndk;27.2.12479018"
yes "y" | sdkmanager "platform-tools"
yes "y" | sdkmanager "platforms;android-31"
yes "y" | sdkmanager "platforms;android-33"
yes "y" | sdkmanager "platforms;android-34"

yes "y" | sdkmanager --licenses

 
git config --global --add safe.directory $HOME/development/flutter/

# mengaktifkan flutter web support
flutter config --enable-web
flutter config --enable-linux-desktop
flutter config --enable-macos-desktop
flutter config --enable-windows-desktop
flutter config --no-analytics
flutter config --android-sdk $HOME/Android/Sdk/

dart --version
flutter doctor --android-licenses