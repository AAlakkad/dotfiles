" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

""" Bundles here:

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

let g:neobundle#install_process_timeout=1500
" General
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ap/vim-css-color'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'auto_mkdir'
NeoBundle 'MatchTag'
NeoBundle 'AutoClose'
NeoBundle 'ervandew/supertab'
" NeoBundle 'Shougo/neocomplete.vim'
" NeoBundle 'Shougo/neosnippet'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'terryma/vim-multiple-cursors'

" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" Development
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'spf13/PIV' " PHP Integration environment for Vim
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'xsbeats/vim-blade'

" Beautifying & Lintering
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'

" Colorschemes
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'blerins/flattown'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck



""" General Config
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
" Maximize GVim on start
if has("gui_running")
    set lines=999 columns=999
endif
set nofoldenable " disable folding


""" Themes
syntax enable
set t_Co=256
set background=dark
colorscheme Tomorrow-Night-Bright
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11
set guioptions-=T
set guioptions-=r
set guioptions-=m " Removes the main menu
set guioptions-=L
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
let g:rehash256 = 1 " For molokai colorscheme only, to set alternative background



""" Bundles configurations
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
" Open NERDTree for the current file argument e.g. gvim .
if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
endif
" Airline (status bar): handle many buffers
let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)"
let g:DisableAutoPHPFolding = 1 " disable PIV's folding

" CtrlP
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 0 "2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab
let g:ctrlp_extensions = ['dir']
let g:ctrlp_dont_split = 'nerdtree'
" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**



""" Key binding
" leader
let mapleader=","
nmap <C-b> :NERDTreeToggle<cr>
" Formatting
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>"


""" Auto stuff
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif



""" make YCM compatible with UltiSnips (using supertab)

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Easy escaping to normal mode
imap jj <esc>

"" Buffers
" Close buffer use: ,w
nmap <leader>w :bd<cr>
" Go to (n) buffer
nmap <leader>1 :bfirst<cr>
nmap <leader>2 :b2<cr>
nmap <leader>3 :b3<cr>
nmap <leader>4 :b4<cr>
nmap <leader>5 :b5<cr>
nmap <leader>6 :b6<cr>
nmap <leader>7 :b7<cr>
nmap <leader>8 :b8<cr>
nmap <leader>9 :blast<cr>

nmap <c-1> :b1<cr>

nmap <C-Left> :bprevious<cr>
nmap <C-Right> :bnext<cr>

" Multiple cursors
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-f>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'
