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
Plug 'SirVer/ultisnips'
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'Chiel92/vim-autoformat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

Plug 'terryma/vim-multiple-cursors'
Plug 'dietsche/vim-lastplace'
Plug 'ntpeters/vim-better-whitespace'

Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'

Plug 'ap/vim-buftabline'
Plug 'scrooloose/syntastic'

Plug 'Townk/vim-autoclose'

" PHP & Development
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'spf13/PIV'
Plug 'sudar/vim-wordpress-snippets'
Plug 'dsawardekar/wordpress.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'HTML-AutoCloseTag'

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
set hidden
" always ignore these files
set wildignore+=*/vendor/**,*/wordpress/**,*/node_modules/**,*/nbproject/**
set nofoldenable " disable folding
set encoding=utf-8


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
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open<CR>
let g:ctrlp_extensions = ['dir']
let g:ctrlp_dont_split = 'nerdtree'

" WordPress
let g:wordpress_vim_wordpress_path = '/home/ammar/www/aliqtisadi/wordpress'

" NerdTREE
let NERDTreeIgnore = ['node_modules', 'nbproject']

" Lastplace
let g:lastplace_ignore = "gitcommit,svn"

" NERD Commenter
let NERDSpaceDelims=1 " add space between comment delimiter and first  character of code

" Syntastic
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

" xolox/vim-easytags settings 
" Where to look for tags files
set tags=~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" Better Whitespace
" Automatically strip the whitespaces for the given file types
autocmd FileType <php,javascript,html,css,sass,scss> autocmd BufWritePre <buffer> StripWhitespace

" PIV
let g:DisableAutoPHPFolding = 1


""" Key binding
" leader
let mapleader=","
" clear search by pressing escape
nnoremap <CR> :noh<CR><CR>
" NERDTree Toggle
nmap <leader>b :NERDTreeTabsToggle<cr>
" Tagbar
nmap <F8> :TagbarToggle<CR>
" CtrlP
map <C-p> :CtrlP<cr>
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" Easy escaping to normal mode
imap jj <esc>
" Buffers
noremap <silent> <C-h> :bnext<CR>
noremap <silent> <C-l> :bprev<CR>
" Close buffer use: ,w
nmap <leader>w :bd<cr>
