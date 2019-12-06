set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Always make cursor a blinking vertical line
set guicursor=n-v-c:ver25-iCursor-blinkon10
set guicursor+=i:ver25-iCursor-blinkon10

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ 
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Random stuff
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Language Server
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Reset to iterm2 cursor after leaving neovim
au VimLeave * set guicursor=
