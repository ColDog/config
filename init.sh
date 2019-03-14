#!/bin/bash

set -e

ruby="2.6.2"
golang="1.11.5"
python="3.7.2"
node="v10.15.1"

source ./dotfiles/files/.config/bash

echo ">>> init packages"
./packages/init.sh

echo ">>> installing ruby"
rbenv install $ruby
rbenv global $ruby

echo ">>> installing golang"
goenv install $golang
goenv global $golang

echo ">>> installing python"
pyenv install $python
pyenv global $python

echo ">>> installing node"
nvm install $node
nvm use $node

echo ">>> sync dotfiles"
./dotfiles/save.sh

echo ">>> add to bashrc"
echo "source $HOME/.config/bash"

echo "complete!"
