call plug#begin('~/.vim/plugged')

" Basic stuff
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

Plug 'godlygeek/csapprox'
" Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'

" Colorschemes
Plug 'flazz/vim-colorschemes'

Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
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

" Plug 'ap/vim-buftabline'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/syntastic'

Plug 'Raimondi/delimitMate'

" PHP & Development
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'spf13/PIV', {'for': 'php'}
Plug 'xsbeats/vim-blade', {'for': 'php'}
Plug 'sudar/vim-wordpress-snippets', {'for': 'php'}
Plug 'dsawardekar/wordpress.vim', {'for': 'php'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'othree/html5.vim', {'for': ['html', 'php']}
Plug 'HTML-AutoCloseTag', {'for': ['html', 'php']}
Plug 'mattn/emmet-vim', {'for': ['html', 'php']}
Plug 'Valloric/MatchTagAlways', {'for': ['html', 'php']}

call plug#end()

syntax enable
set t_Co=256
set background=dark
colorscheme hybrid


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
scriptencoding utf-8



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
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_cmd = 'CtrlPMixed'
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command =
        \ 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

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

let g:syntastic_php_phpcs_post_args = " --encoding=utf-8"
" Use PSR2 standard instead of default PEAR
" http://www.php-fig.org/psr/2/
let g:syntastic_php_phpcs_post_args .= " --standard=PSR2"

" xolox/vim-easytags settings
" Where to look for tags files
set tags=~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:easytags_file = "~/.vim/tags"

" JavaScript Libraries Syntax
let g:used_javascript_libs = 'angular, jquery'

" Better Whitespace
" Automatically strip the whitespaces for the given file types
autocmd FileType <php,javascript,html,css,sass,scss> autocmd BufWritePre <buffer> StripWhitespace

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" PIV
let g:DisableAutoPHPFolding = 1

" Lightline.vim
set noshowmode " don't show the -- Mode -- line, it's already in lightline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'mode_map': { 'c': 'NORMAL' },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ }
            " \ 'component_function': {
            " \   'modified': 'MyModified',
            " \   'readonly': 'MyReadonly',
            " \   'fugitive': 'MyFugitive',
            " \   'filename': 'MyFilename',
            " \   'fileformat': 'MyFileformat',
            " \   'filetype': 'MyFiletype',
            " \   'fileencoding': 'MyFileencoding',
            " \   'mode': 'MyMode',
            " \ },
            " \ 'separator': { 'left': '', 'right': '' },
            " \ 'subseparator': { 'left': '', 'right': '' }
            " \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


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


" Manual Status line
let &statusline  = "%#StatusLineNC# %{getcwd()==$HOME?'~':fnamemodify(getcwd(), ':t')}%* "
let &statusline .= "%f"
let &statusline .= "%#StatusLineNC#%{StatuslineGit()}%* "
let &statusline .= '%1*%{&modified && !&readonly?"\u25cf":""}%*'
let &statusline .= '%1*%{&modified && &readonly?"\u25cb":""}%*'
let &statusline .= '%2*%{&modifiable?"":"\u25cb"}%*'
let &statusline .= '%3*%{&readonly && &modifiable && !&modified?"\u25cb":""}%*'
let &statusline .= "%="
let &statusline .= "%#StatusLineNC#%{StatuslineIndent()}%* "
let &statusline .= '%#StatuslineNC#%{(strlen(&fileencoding) && &fileencoding !=# &encoding)?&fileencoding." ":""}'
let &statusline .= '%{&fileformat!="unix"?" (".&fileformat.") ":""}%*'
let &statusline .= '%{strlen(&filetype)?&filetype." ":""}'
let &statusline .= '%#Error#%{exists("*SyntasticStatuslineFlag")?SyntasticStatuslineFlag():""}%*'

function! StatuslineGit()
  if !exists('*fugitive#head')
    return ''
  endif
  let l:out = fugitive#head(8)
  if l:out !=# ''
    let l:out = ' @ ' . l:out
  endif
  return l:out
endfunction

function! StatuslineIndent()
  if !&modifiable
    return ''
  endif
  let l:symbol = &expandtab ? "\u2022" : "\u21e5 "
  let l:amount = exists('*shiftwidth') ? shiftwidth() : &shiftwidth
  return &expandtab ? repeat(l:symbol, l:amount) : l:symbol
endfunction
