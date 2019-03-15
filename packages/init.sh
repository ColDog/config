#!/bin/bash

set -e

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
