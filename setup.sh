# To do prior to setup
# 1. Install Git + Homebrew
# 2. Install Zsh
# 3. Install neovim
# 4. Comment out last line of zshrc
# No linux, you need a Mac for this cos homebrew dependencies, guess that's another #TODO

# Set links, assuming that cwd is in the dotfiles folder
setopt EXTENDED_GLOB
for file in ./^setup.sh(.N); do
  ln -s "$file" "$HOME/${file:t}"
done

# Install all homebrew packages
brew install "$(grep . homebrew.txt | tr '\n' ' ')"
brew cask install "$(grep . homebrewcask.txt | tr '\n' ' ')"

# Tmux
ln -s ~/tmux/tmux.conf ~/.tmux.conf

# Neovim setup
mkdir -p .config
mkdir -p .config/nvim
ln -s ~/nvim/init.vim .config/nvim/init.vim
ln -s ~/nvim/coc-settings.json .config/nvim/coc-settings.json

# Launch and change default shell to zsh
zsh
chsh -s /bin/zsh
