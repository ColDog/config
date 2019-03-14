#!/bin/bash

set -e

for pkg in $(cat ./packages/packages.txt); do
  apt-get install -y $pkg
done

echo ">>>> installing pip"
pip install -r ./packages/pip.txt
