#!/bin/bash

set -e

version="0.17.5"

cd /var/lib/dpkg-local

url="https://github.com/junegunn/fzf-bin/releases/download/$version/fzf-$version-linux_amd64.tgz"

curl -sSL $url -o fzf.tar.gz
tar -xzf fzf.tar.gz

fpm --verbose \
  -s dir \
  -t deb \
  -n fzf \
   -v $version \
  --url=https://github.com/junegunn/fzf-bin \
  --vendor=fzf \
  --description "fzf" \
  ./fzf=/usr/local/bin/fzf

rm fzf
