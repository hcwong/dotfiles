source ~/.git-prompt.sh

alias ls='ls -G'
alias s="git status"
alias gm="git checkout master"
alias gpom="git pull origin master"
alias grb="git rebase"

export GOPATH=$HOME/go

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
