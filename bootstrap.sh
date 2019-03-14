#!/bin/bash

apt-get update
apt-get install -y wget unzip

wget https://github.com/ColDog/config/archive/master.zip
unzip master.zip 

mkdir -p ~/.config/
mv config-master ~/.config/config
ls ~/.config/config
cd ~/.config/config
./init.sh
