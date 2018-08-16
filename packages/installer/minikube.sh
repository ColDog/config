#!/bin/bash

set -e

version="0.28.0"

cd /var/lib/dpkg-local

curl -Lo minikube https://storage.googleapis.com/minikube/releases/v${version}/minikube-linux-amd64
chmod +x minikube

fpm --verbose \
  -s dir \
  -t deb \
  -n minikube \
   -v $version \
  --url=https://kubernetes.io \
  --vendor=Kubernetes \
  --description "kubernetes minikube" \
  ./minikube=/usr/local/bin/minikube

rm minikube
