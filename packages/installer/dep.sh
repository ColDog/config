#!/bin/bash

set -e

version="0.5.0"

cd /var/lib/dpkg-local

curl -o dep -LO https://github.com/golang/dep/releases/download/v${version}/dep-linux-amd64
chmod +x dep

fpm --verbose \
  -s dir \
  -t deb \
  -n dep \
   -v $version \
  --url=https://github.com/golang/dep \
  --vendor=Golang \
  --description "golang-dep" \
  ./dep=/usr/local/bin/dep

rm dep
