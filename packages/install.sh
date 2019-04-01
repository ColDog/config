#!/bin/bash

set -e

for pkg in $(cat ./packages/packages.txt); do
  apt-get install -y $pkg
done

echo ">>>> installing pip"
pip install -r ./packages/pip.txt

echo ">>>> installing scripts"
for ex in $(find ./packages/scripts -type f); do
  echo "running $ex"
  $ex
done

echo ">>>> installing ruby"
for pkg in $(cat ./packages/gems.txt); do
  gem install
done

