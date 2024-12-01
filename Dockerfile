FROM ubuntu:24.04

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    sudo \
    && apt-get clean
