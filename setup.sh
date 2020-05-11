# To do prior to setup
# 1. Install Git + Homebrew
# 2. Install Zsh
# 3. Comment out last line of zshrc
# No linux, you need a Mac for this cos homebrew dependencies, guess that's another #TODO

zsh

cd ~/

# Set links, assuming that cwd is in the dotfiles folder
# TODO: not copy git over with the globbing
setopt EXTENDED_GLOB
for file in ./dotfiles/{,.}*; do
  ln -s "$file" "$HOME/${file:t}"
done

# Tmux
ln -s ./tmux/tmux.conf ~/.tmux.conf

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Neovim setup
mkdir "$HOME/.config"
mkdir "$HOME/.config/nvim"
cd ~/.config/nvim
ln -s ../../dotfiles/nvim/init.vim init.vim
ln -s ../../dotfiles/nvim/coc-settings.json coc-settings.json

cd ~/dotfiles

# Install all homebrew packages
brew install $(grep . homebrew.txt | tr '\n' ' ')
brew cask install $(grep . homebrewcask.txt | tr '\n' ' ')

# Copy over zprezto setup
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Launch and change default shell to zsh
# If issues, use this link: https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/
chsh -s /bin/zsh
