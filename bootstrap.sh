#!/bin/bash

set -e

# Install all the build dependencies initially here.
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y \
  git \
  ruby-dev \
  build-essential \
  curl \
  wget \
  libsqlite3-dev \
  sqlite3 \
  bzip2 \
  libbz2-dev \
  zlib1g-dev \
  libssl-dev \
  openssl \
  python-openssl \
  libgdbm-dev \
  liblzma-dev \
  libreadline-dev \
  libncursesw5-dev \
  uuid-dev \
  xz-utils \
  tk-dev \
  libffi-dev \
  software-properties-common

mkdir -p ~/.config/

if [ ! -d ~/.config/config ]; then
  git clone https://github.com/ColDog/config.git ~/.config/config
  cd ~/.config/config
else
  cd ~/.config/config
  git pull
fi

./init.sh
