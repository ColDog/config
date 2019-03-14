#!/bin/bash

set -e

ruby="2.6.2"
golang="1.11.5"
python="3.7.2"
node="v10.15.1"

source ./dotfiles/files/.config/bash

echo ">>> installing ruby"
rbenv install $ruby
rbenv global $ruby
ruby --version

echo ">>> installing golang"
goenv install $golang
goenv global $golang
go version

echo ">>> installing python"
pyenv install $python
pyenv global $python
python --version

echo ">>> installing node"
nvm install $node
nvm use $node
node --version

echo ">>> init packages"
./packages/init.sh

echo ">>> sync dotfiles"
./dotfiles/save.sh

echo ">>> install vim"
nvim +'PlugInstall --sync' +qa

echo ">>> add to bashrc"
echo "source $HOME/.config/bash"

echo "complete!"
