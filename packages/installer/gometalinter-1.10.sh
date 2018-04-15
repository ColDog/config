#!/bin/bash

set -e

version="2"

cd /var/lib/dpkg-local

export GOPATH="/var/lib/dpkg-local/tmp"
export PATH="$PATH:/usr/lib/go-1.10/bin"

go get -u gopkg.in/alecthomas/gometalinter.v2

mv $GOPATH/bin/gometalinter.v2 $GOPATH/bin/gometalinter
$GOPATH/bin/gometalinter --install

bin="$GOPATH/bin"

fpm --verbose \
  -s dir \
  -t deb \
  -n "gometalinter-1.10" \
   -v $version \
  --url=https://github.com/alecthomas/gometalinter \
  --vendor=Gometalinter \
  --description "gometalinter" \
  $GOPATH/bin=/usr/lib/go-1.10

rm -rf $GOPATH
