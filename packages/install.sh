
#!/bin/bash

for pkg in $(cat packages.txt); do
  apt-get install -y $pkg
done