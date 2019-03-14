#!/bin/bash

echo "deb http://pkg.scaleft.com/deb linux main" | tee -a /etc/apt/sources.list
curl -C - https://dist.scaleft.com/pki/scaleft_deb_key.asc | apt-key add -

