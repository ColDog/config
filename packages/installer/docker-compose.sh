#!/bin/bash

set -e

cd /var/lib/dpkg-local

version="1.18.0"

curl -o docker-compose -L https://github.com/docker/compose/releases/download/$version/docker-compose-`uname -s`-`uname -m`
chmod +x docker-compose

fpm --verbose \
  -s dir \
  -t deb \
  -n docker-compose -v $version \
  --url=https://docker.com \
  --vendor=Docker \
  --description "docker-compose" \
  ./docker-compose=/usr/local/bin/docker-compose

rm docker-compose
