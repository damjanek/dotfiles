" set term=ansi
set t_Co=256
filetype plugin on " Enable filetype plugins
filetype indent on " Enable filetype plugins
set nocompatible
set ignorecase
set smartcase
set hlsearch


set backspace=2
inoremap ^? ^H
syntax on
set encoding=utf8

set ruler
set showcmd
set gdefault
set nobackup
set nodigraph
set incsearch
"set nohlsearch
set nojoinspaces
set magic


set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set pastetoggle=<F2>

set laststatus=2
set tabstop=2
set bg=dark
set bs=2
set smartindent 
set autoindent

execute pathogen#infect()

colorscheme solarized

highlight Comment ctermfg=lightblue
hi BadWhitespace ctermbg=lightblue guibg=lightblue

set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

