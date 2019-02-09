#!/bin/bash

function git_branch() {
  git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ /[/" | sed "s/$/]/"
}

function kubernetes_context() {
  echo "[$( kubectl config current-context 2>/dev/null )]"
}

export PS1='\W $(git_branch) $(kubernetes_context) $ '

function to() {
  arg="$1/$2"
  if [ "$1" == "c" ]; then arg="coldog"; fi
  if [ "$1" == "t" ]; then arg="techdroplabs"; fi
  if [ "$1" == "s" ]; then arg="sendwithus"; fi

  cd $HOME/Workspace/src/github.com/$arg
}

alias com="git add -A && git commit -m"

export DYS_ROOT="/home/colin/Workspace/src/github.com/techdroplabs/dyspatch"
export SWU_ROOT="/home/colin/Workspace/src/github.com/sendwithus/tool-cli"
export CFG_ROOT="/home/colin/Workspace/src/github.com/coldog/config"
export GOPATH="$HOME/Workspace"

export PATH="$PATH:$GOPATH/bin:$DYS_ROOT:$SWU_ROOT/bin:$CFG_ROOT:~/.bin/"

export KUBECONFIG=~/.kube/config:~/.kube/production.kubeconfig:~/.kube/staging.kubeconfig:~/.kube/staging-us-east-2.kubeconfig

# Since I am using a non-POSIX locale this is needed so that sort produces reliable output.
export LC_ALL=C
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias cat="bat"

# Pyenv:
export PYENV_ROOT="$CFG_ROOT/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Nvm:
export NVM_DIR="$CFG_ROOT/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
