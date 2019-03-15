#!/bin/bash

# Install all the build dependencies initially here.
echo "Canada/Pacific" > /etc/timezone
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
  libgdbm-dev \
  libgdbm-compat-dev \
  liblzma-dev \
  libreadline-dev \
  libncursesw5-dev \
  uuid-dev \
  xz-utils \
  tk-dev \
  libffi-dev

mkdir -p ~/.config/
git clone https://github.com/ColDog/config.git ~/.config/config

cd ~/.config/config
./init.sh
