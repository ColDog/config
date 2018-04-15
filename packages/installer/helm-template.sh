#!/bin/bash

set -e

version="2.5.1"

cd /var/lib/dpkg-local

curl -sSL https://github.com/technosophos/helm-template/releases/download/2.5.1%2B2/helm-template-linux-2.5.1.2.tgz -o helm-template.tar.gz
mkdir helm-template
tar -xzf helm-template.tar.gz -C helm-template
mv helm-template/tpl tpl
rm -rf helm-template
mv tpl helm-template

fpm --verbose \
  -s dir \
  -t deb \
  -n helm-template \
   -v $version \
  --url=https://github.com/technosophos/helm-template \
  --vendor=helm-template \
  --description "helm-template" \
  ./helm-template=/usr/local/bin/helm-template

rm helm-template
