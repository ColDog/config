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

export GOPATH="$HOME/Workspace"
export PATH="$PATH:$GOPATH/bin"

export KUBECONFIG=~/.kube/config:~/.kube/production.kubeconfig:~/.kube/staging.kubeconfig

# Since I am using a non-POSIX locale this is needed so that sort produces reliable output.
export LC_ALL=C
