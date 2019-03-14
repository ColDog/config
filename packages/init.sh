#!/bin/bash

set -e

mkdir -p /var/lib/dpkg-local


echo ">>>> installing core tools"
apt-get update

apt install -y ruby-dev
gem install -y fpm

for ex in $(find ./installer -type f); do
  echo ">>>> running $ex"
  $ex
done

echo ">>>> running update-local-repo.sh"
./update-local-repo.sh

for ex in $(find repos); do
  echo ">>>> running $ex"
  $ex
done

echo ">>>> running apt-get update"
apt-get update

echo ">>>> installing"
./install.sh
