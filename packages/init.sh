#!/bin/bash

for ex in $(find installer); do
  echo ">>>> running $ex"
  $ex
done

echo ">>>> running update-local-repo.sh"
./update-local-repo.sh

for ex in $(find repos); do
  echo ">>>> running $ex"
  $ex
done

echo ">>>> running apt-get update"
apt-get update

echo ">>>> installing"
./install.sh
