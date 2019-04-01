#!/bin/bash

docker run --rm -i \
  -v $PWD:/usr/local/config \
  ubuntu \
  /usr/local/config/bootstrap.sh
