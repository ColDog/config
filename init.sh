#!/bin/bash

set -e

ruby="2.6.2"
golang="1.11.5"
python="3.7.2"
node="v10.15.1"

source ./dotfiles/files/.config/bash

echo ">>> installing ruby"
rbenv install -s $ruby
rbenv global $ruby
ruby --version

echo ">>> installing golang"
goenv install -s $golang
goenv global $golang
go version

echo ">>> installing python"
pyenv install -s $python
pyenv global $python
python --version

echo ">>> installing node"
nvm install $node
nvm use $node
node --version

echo ">>> init packages"
sudo ./packages/init.sh

echo ">>> sync dotfiles"
./dotfiles/load.sh

echo ">>> install vim"
nvim +'PlugInstall --sync' +qa

echo ">>> add to bashrc"
echo "source $HOME/.config/bash"

echo "complete!"
