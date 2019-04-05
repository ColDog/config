#!/bin/bash

set -e

# This script can't be run multiple times in a row, it sucks.
if [ -d /var/lib/dpkg-local ]; then
  exit 0
fi

mkdir -p /var/lib/dpkg-local


echo ">>>> installing core tools"
gem install --no-document fpm

for ex in $(find ./packages/installer -type f); do
  echo ">>>> running $ex"
  $ex
done

echo ">>>> running update-local-repo.sh"
./packages/update-local-repo.sh

for ex in $(find ./packages/repos -type f); do
  echo ">>>> running $ex"
  $ex
done

echo ">>>> running apt-get update"
apt-get update

echo ">>>> installing"
./packages/install.sh
