#!/bin/bash

set -e

for file in $(cat ./dotfiles/files.txt); do
  echo $file
  cp files/$file $HOME/$file
done
