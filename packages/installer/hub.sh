#!/bin/bash

set -e

cd /var/lib/dpkg-local

version="2.2.9"

curl -o hub.tgz -L https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz
tar -xzf hub.tgz
ls -la

fpm --verbose \
  -s dir \
  -t deb \
  -n hub -v $version \
  --url=https://github.com/github/hub \
  --vendor=GitHub \
  --description "hub" \
  ./hub-linux-amd64-${version}/bin/hub=/usr/local/bin/hub \
  ./hub-linux-amd64-${version}/etc/hub.bash_completion.sh=/usr/share/bash-completion/completions/hub

rm hub.tgz
rm -rf hub-linux-amd64-${version}
