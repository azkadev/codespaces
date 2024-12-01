FROM ubuntu:24.04

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    sudo \
    wget \
    && apt-get clean

RUN wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.30.1/fastfetch-linux-amd64.deb && sudo apt install "$PWD/fastfetch-linux-amd64.deb" -y