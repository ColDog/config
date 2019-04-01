#!/bin/bash

set -e

version="2.2.4"

cd /var/lib/dpkg-local

curl -o vagrant.zip -LO https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}_linux_amd64.zip
unzip vagrant
chmod +x vagrant

fpm --verbose \
  -s dir \
  -t deb \
  -n vagrant \
   -v $version \
  --url=https://vagrantup.com \
  --vendor=Vagrant \
  --description "vagrant" \
  ./vagrant=/usr/local/bin/vagrant

rm vagrant
rm vagrant.zip
