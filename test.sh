#!/bin/bash

docker run --rm -it \
  -v $PWD:/root/.config/config \
  ubuntu
