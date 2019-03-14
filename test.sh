#!/bin/bash

docker run --rm -it \
  -v $HOME/.ssh:/root/.ssh/ \
  ubuntu
