#!/bin/bash

set -e

version="1.9.4"

cd /var/lib/dpkg-local

curl -o kubectl -LO https://storage.googleapis.com/kubernetes-release/release/v$version/bin/linux/amd64/kubectl
chmod +x kubectl

fpm --verbose \
  -s dir \
  -t deb \
  -n kubectl \
   -v $version \
  --url=https://kubernetes.io \
  --vendor=Kubernetes \
  --description "kubernetes" \
  ./kubectl=/usr/local/bin/kubectl

rm kubectl
