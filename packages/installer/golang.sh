#!/bin/bash

set -e

version="1.10.1"

cd /var/lib/dpkg-local

curl -o golang.tar.gz -LO "https://dl.google.com/go/go${version}.linux-amd64.tar.gz"
mkdir golang
tar -C golang -xzf golang.tar.gz

fpm --verbose \
  -s dir \
  -t deb \
  -n golang-${version} \
   -v $version \
  --url=https://golang.org \
  --vendor=Golang \
  --description "golang" \
  ./golang/go/=/usr/lib/go-${version}/

rm golang.tar.gz
rm -rf golang
