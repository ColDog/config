#!/bin/bash

docker run --rm -it -v $PWD:/usr/local/config \
  ubuntu /usr/local/config/bootstrap.sh
