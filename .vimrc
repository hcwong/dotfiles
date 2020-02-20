set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
syntax on
set number
set ruler
set hidden
set laststatus=2
set cc=81
filetype plugin on

" Enable mouse cos I'm an IDE pleb
set mouse=a

" Split below
set splitbelow

" Keybindings
imap jk <Esc>
nmap ,n :NERDTreeFind<CR>
map <C-o> :NERDTreeToggle<CR>

" vim-airline config stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" Customize coc
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" I hide my ctags file in the git folder
set notagrelative

" Fast buffer switching
map bn :bn<cr>
map bp :bp<cr>
map bd :lclose<bar>b#<bar>bd #<CR>

" go import packages on save
let g:go_fmt_command = "goimports"

