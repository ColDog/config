#!/bin/bash

mkdir -p /var/lib/dpkg-local

cd /var/lib/dpkg-local
dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
