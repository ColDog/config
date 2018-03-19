#!/bin/bash

echo "deb [trusted=yes] file:/var/lib/dpkg-local ./" > /etc/apt/sources.list.d/local.list
