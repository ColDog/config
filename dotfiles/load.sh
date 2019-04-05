#!/bin/bash

set -e

for file in $(cat ./dotfiles/files.txt); do
  echo $file
  mkdir -p $(dirname $HOME/$file)
  cp ./dotfiles/files/$file $HOME/$file
done
