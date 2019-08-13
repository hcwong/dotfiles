set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
syntax on
set number
set ruler
set laststatus=2
imap jk <Esc>
map <C-o> :NERDTreeToggle<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'

call plug#end()
