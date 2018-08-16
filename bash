function git_branch() {
  git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ /[/" | sed "s/$/]/"
}

function kubernetes_context() {
  echo "[$( kubectl config current-context 2>/dev/null )]"
}

export PS1='\W $(git_branch) $(kubernetes_context) $ '

alias cr="cd $HOME/Workspace/src/github.com/coldog"
alias swur="cd $HOME/Workspace/src/github.com/sendwithus"
alias dysr="cd $HOME/Workspace/src/github.com/techdroplabs/dyspatch"
alias com="git add -A && git commit -m"

export GO_VERSION="$(cat ~/.goversion)"
export SWU_ROOT="/home/colin/Workspace/src/github.com/techdroplabs/dyspatch"
export CFG_ROOT="/home/colin/Workspace/src/github.com/coldog/config"
export GOPATH="$HOME/Workspace"

export PATH="$PATH:$GOPATH/bin:/usr/lib/go-$GO_VERSION/bin:$SWU_ROOT:$CFG_ROOT"

export KUBECONFIG=~/.kube/config:~/.kube/production.kubeconfig:~/.kube/staging.kubeconfig:~/.kube/staging-us-east-2.kubeconfig

PROG=sft source $CFG_ROOT/autocomplete

# Since I am using a non-POSIX locale this is needed so that sort produces reliable output.
export LC_ALL=C
export LC_ALL=C.UTF-8
export LANG=C.UTF-8


alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
