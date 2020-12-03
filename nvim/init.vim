set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Vim settings
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set number
set ruler
set hidden
set splitbelow
set laststatus=2
set cc=81
set termguicolors
set ignorecase
filetype plugin on
syntax on

" Enable mouse cos I'm an IDE pleb
set mouse=a

" Always make cursor a blinking vertical line
set guicursor=n-v-c:ver25-iCursor-blinkon10
set guicursor+=i:ver25-iCursor-blinkon10

" Reset to iterm2 cursor after leaving neovim
au VimLeave * set guicursor=


" Keybindings
imap jk <Esc>
map gn :bn<cr>
map gm :bp<cr>
map td :lclose<bar>bp<bar>bd #<CR>
map <silent> <C-l> :wincmd l<CR>
map <silent> <c-h> :wincmd h<CR>
map <esc> :noh<cr>

" Enable persistent undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ 
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" General stuff
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'ton/vim-bufsurf'

" Search related stuff
Plug 'terryma/vim-multiple-cursors'
Plug 'haya14busa/incsearch.vim'
Plug 'wincent/ferret'

" Highlighting stuff 
Plug 'sheerun/vim-polyglot'

" Snippet plugins
Plug 'honza/vim-snippets'

" Language Specific Plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim'

" Typescript stuff
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Language Server
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'dense-analysis/ale'

" Themes
Plug 'morhetz/gruvbox'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Utils
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()
 
" Customize coc
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
set updatetime=300
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ?  coc#_select_confirm() :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Define ctags tag location
set tags=./.git/tags;$HOME

" I hide my ctags file in the git folder
set notagrelative

" Terminal mode key bindings
tnoremap <Esc> <C-\><C-n>

" Nerdtree Stuff
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
nmap ,n :NERDTreeFind<CR>
map <C-o> :NERDTreeToggle<CR>

" Gruvbox theme
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_bold = '1'
let g:gruvbox_italic = '1'

" vim-airline config stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" fzf stuff
" TODO: Should really clean this up. A lot of junk i don't use here

" fzf-vim configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Map fzf vim and regrep
map <C-g> :Rg<cr>
map <C-a> :Ag<cr>
map <C-j> :Files<cr>

" ale linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint', 'prettier'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_tsserver_autoimport = 1

" go import packages on save
let g:go_fmt_command = "goimports"

" bufsurf stuff
nmap <silent> <Leader>f :BufSurfBack<CR>
nmap <silent> <Leader>b :BufSurfForward<CR>

" options for markdown preview
nmap <Leader>md <Plug>MarkdownPreviewToggle
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
