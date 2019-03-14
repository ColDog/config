#!/bin/bash

for file in $(cat ./dotfiles/files.txt); do
  echo $file
  mkdir -p $(dirname ./dotfiles/files/$file)
  cp $HOME/$file ./dotfiles/files/$file
done
