" no need for vi compability
set nocompatible

" don't allow inline modelines
set nomodeline

" don't wrap lines
set nowrap

" allow backspace to delete characters
set bs=2

" tabs have a width of 4
set softtabstop=4

" display tab characters with a width of 4
set tabstop=4

" indent lines by this width
set shiftwidth=4

" insert tabs as spaces
set expandtab

" numbered lines
set number

" round indent to multiple of 'shiftwidth'
set shiftround

" align the new line indent with the previous line
set autoindent

" vundle
if isdirectory(expand('$HOME/.vim/bundle/vundle'))
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    " vundle bundles
    Bundle 'kien/ctrlp.vim'
    Bundle 'nanotech/jellybeans.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'bling/vim-airline'
    Bundle 'bling/vim-bufferline'

    " extra syntax
    Bundle 'othree/html5.vim'
    Bundle 'groenewege/vim-less'
    Bundle 'jnwhiteh/vim-golang'

    " set color scheme (and don't complain if it doesn't exist)
    silent! colorscheme jellybeans

    " ctrlp mode
    let g:ctrlp_cmd = 'CtrlPMixed'

    " ctrlp search command
    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f'
    \ }

    " only display bufferline in status line
    let g:bufferline_echo = 0

    " vim-airline config
    let g:airline#extensions#hunks#enabled = 0
    let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }

    " ensure that syntastic always uses flake8
    let g:syntastic_python_checkers = ['flake8', 'python']
else
    silent! colorscheme torte
endif

" filetype detection and smart indent
filetype plugin indent on

" enable syntax highlighting
syntax on

" always show the status line as the second last line
set laststatus=2

" toggle paste mode
set pastetoggle=<F10>

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" disable home, end, pageup, pagedown
noremap <home> <nop>
noremap <end> <nop>
noremap <pageup> <nop>
noremap <pagedown> <nop>
inoremap <home> <nop>
inoremap <end> <nop>
inoremap <pageup> <nop>
inoremap <pagedown> <nop>

" map jj to escape
inoremap jj <Esc>

" map leader
let mapleader = ","

" reformat
noremap <leader>f gg=G

" disable visual and audible bell
set vb t_vb=

" set 256 colors
set t_Co=256

" show column marker
if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=235
endif

" highlight matches
set hlsearch

" incremental searching
set incsearch

" case insensitive search (unless atleast one capital letter is given)
set ignorecase
set smartcase

" clear search highlights
noremap <leader>q :nohlsearch<cr>

" ctags
set tags=tags

" buffer mappings
noremap <leader>n :bn<cr>
noremap <leader>p :bp<cr>
noremap <leader>l :ls<cr>

" hidden buffers
set hidden

" directory for swap files
set directory=~/.vim/swap
