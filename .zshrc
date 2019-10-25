#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# My zsh customizations

# Get aliases
source ~/.aliases.sh

# Export paths to various binary files
export GOPATH=$HOME/go

# RVM
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Source GHC for Haskell
source /Users/joshuawong/.ghcup/env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
