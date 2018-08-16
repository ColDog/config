#!/bin/bash

set -e

version="0.3.0"

cd /var/lib/dpkg-local

curl -sSL -o heptio-authenticator-aws \
  https://github.com/heptio/authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64

fpm --verbose \
  -s dir \
  -t deb \
  -n heptio-authenticator-aws \
   -v $version \
  --url=https://github.com/heptio/authenticator \
  --vendor=heptio-authenticator-aws \
  --description "heptio-authenticator-aws" \
  ./heptio-authenticator-aws=/usr/local/bin/heptio-authenticator-aws

rm heptio-authenticator-aws
