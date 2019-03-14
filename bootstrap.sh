#!/bin/bash

apt-get update
apt-get install -y git ruby-dev build-essential

mkdir -p ~/.config/
git clone https://github.com/ColDog/config.git ~/.config/config

cd ~/.config/config
./init.sh
