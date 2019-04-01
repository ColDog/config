#!/bin/bash

set -e

version="2.9.1"

cd /var/lib/dpkg-local

curl -o helm.tgz -LO https://storage.googleapis.com/kubernetes-helm/helm-v${version}-linux-amd64.tar.gz
tar -zxvf helm.tgz
mv linux-amd64/helm ./helm

fpm --verbose \
  -s dir \
  -t deb \
  -n helm \
   -v $version \
  --url=https://kubernetes.io \
  --vendor=Kubernetes \
  --description "kubernetes helm" \
  ./helm=/usr/local/bin/helm

rm helm.tgz
rm -rf linux-amd64
rm helm
