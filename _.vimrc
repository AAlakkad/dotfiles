call plug#begin('~/.vim/plugged')

" Basic stuff
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

Plug 'godlygeek/csapprox'
" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'

Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'

Plug 'terryma/vim-multiple-cursors'
Plug 'dietsche/vim-lastplace'


Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

call plug#end()

syntax enable
set t_Co=256
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-tomorrow

let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo"
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase
set incsearch
set hlsearch " Highlight searches
set autowrite  "Save on buffer switch
set mouse=a
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
" always ignore these files
set wildignore+=*/vendor/**
set wildignore+=*/wordpress/**
set wildignore+=*/node_modules/**

"" Configurations

" Open NERDTree for the current file argument e.g. gvim .
if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
endif

" CtrlP
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 0 "2  Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_extensions = ['dir']
let g:ctrlp_dont_split = 'nerdtree'

" Lastplace
let g:lastplace_ignore = "gitcommit,svn"

""" Key binding
" leader
let mapleader=","
" NERDTree Toggle
nmap <leader>b :NERDTreeToggle<cr>
" Tagbar
nmap <F8> :TagbarToggle<CR>
" CtrlP
map <C-p> :CtrlP<cr>
