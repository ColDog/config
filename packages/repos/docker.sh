#!/bin/sh

RELEASE="xenial"

# Docker (Harcoded to xenial)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $RELEASE stable"
apt-cache policy docker-ce

