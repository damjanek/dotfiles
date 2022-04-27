set term=xterm-256color
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

set laststatus=2
set tabstop=2
set bg=dark
set bs=2
set smartindent 
set autoindent
set colorcolumn=120
set matchpairs+=(:),{:},[:],<:>,':',":"
set re=0
cabbrev h vert h
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun


call plug#begin()
Plug 'patricka3125/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fcevado/molokai_dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
call plug#end()

" LSP settings
inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <CR>  pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '--remote=auto']},
        \ 'whitelist': ['go'],
        \ })
endif
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gr <plug>(lsp-rename)
    " refer to doc to add more commands
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0



" Snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

" Vim go settings
let g:go_highlight_types=1
let g:go_highlight_functions=1
let g:go_fmt_command="goimports"
let g:go_def_mapping_enabled=0
let g:go_gopls_options = ['--remote=auto']
call SetupCommandAlias("alt", "GoAlternate")
call SetupCommandAlias("imp", "GoImports")
call SetupCommandAlias("lint", "GoMetaLinter")
call SetupCommandAlias("build", "GoBuild")
call SetupCommandAlias("cover", "GoCoverage")
call SetupCommandAlias("clear", "GoCoverageClear")
call SetupCommandAlias("err", "GoIfErr")
call SetupCommandAlias("def", "GoDef")

set background=dark
colorscheme solarized

highlight Comment ctermfg=lightblue

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

au BufNewFile,BufRead Jenkinsfile setf groovy
"" Show unwanted whitespaces
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
