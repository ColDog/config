#!/bin/bash

set -e

go_version="$1"
version="0.1"

if [ "$go_version" = "" ]; then 
  echo 'go version must be first arg'
  exit 1
fi

cd /var/lib/dpkg-local

export GOPATH="/var/lib/dpkg-local/tmp"
export PATH="$PATH:/usr/lib/go-${go_version}/bin"

go get -u gopkg.in/alecthomas/gometalinter.v2
go get github.com/zmb3/gogetdoc

mv $GOPATH/bin/gometalinter.v2 $GOPATH/bin/gometalinter
$GOPATH/bin/gometalinter --install

ls -la $GOPATH/bin/

bin="$GOPATH/bin"

fpm --verbose \
  -s dir \
  -t deb \
  -n "gotools-${go_version}" \
   -v $version \
  --url=https://github.com/ColDog/config \
  --vendor=ColDog \
  --description "gotools" \
  $GOPATH/bin=/usr/lib/go-${go_version}

rm -rf $GOPATH
