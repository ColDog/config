#!/bin/bash

set -e

version="0.11.4"

cd /var/lib/dpkg-local

curl -o terraform.zip -LO https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip
unzip terraform
chmod +x terraform

fpm --verbose \
  -s dir \
  -t deb \
  -n terraform \
   -v $version \
  --url=https://terraform.io \
  --vendor=Terraform \
  --description "terraform" \
  ./terraform=/usr/local/bin/terraform

rm terraform
rm terraform.zip
