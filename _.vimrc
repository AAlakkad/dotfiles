" install https://github.com/junegunn/vim-plug once to handle the plugins

call plug#begin('~/.vim/plugged')

" Basic stuff
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'jpo/vim-railscasts-theme'

Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'Chiel92/vim-autoformat'

Plug 'terryma/vim-multiple-cursors'


Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

call plug#end()

syntax enable
set t_Co=256
set background=dark
colorscheme jellybeans

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


""" Key binding
" leader
let mapleader=","
