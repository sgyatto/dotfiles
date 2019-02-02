scriptencoding utf-8
filetype off
filetype plugin indent off

"==========================
" Use junegunn/vim-plug
"   https://github.com/junegunn/vim-plug
"==========================

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'w0ng/vim-hybrid'

call plug#end()
filetype plugin indent on

"==========================
" Init
"==========================

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,sjis
set ambiwidth=double
set clipboard=unnamed,autoselect
set mouse=a
"set notimeout
"set whichwrap=b,s,[,],<,>,~
set ts=4 sw=4 sts=0
set expandtab
set visualbell t_vb=
set history=1000
set hidden
set number
set ruler
set wrap
set laststatus=2
set statusline=%y
set cmdheight=2
set showcmd
set title
set list
set listchars=tab:>-,trail:-
set autoindent
set backspace=indent,eol,start
set showmatch
set nobackup

"==========================
" Search
"==========================

set wrapscan
set hlsearch
set incsearch
set ignorecase
set smartcase

"==========================
" Color
"==========================

syntax on
set t_Co=256
set background=dark
colorscheme hybrid

"==========================
" Autocmd
"==========================

augroup FileTypeAutoCmd
  autocmd!
  autocmd FileType ruby setlocal ts=2 sw=2 sts=0
  autocmd FileType javascript setlocal ts=2 sw=2 sts=0
  autocmd FileType xml,html,css setlocal ts=2 sw=2 sts=0
  autocmd FileType go setlocal noexpandtab ts=4 sw=4
augroup END

"==========================
" Key Bind
"==========================

nnoremap ; :

noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-w> :q<CR>
inoremap <C-w> <C-o>:w<CR>


" ファイルのエンコーディングを指定して開き直す
nnoremap ,eU :e ++enc=utf-8<CR>
nnoremap ,eE :e ++enc=euc-jp<CR>
nnoremap ,eC :e ++enc=cp932<CR>

" エンコーディング形式の変更
nnoremap ,U :set fileencoding=utf8<CR>
nnoremap ,E :set fileencoding=euc-jp<CR>
nnoremap ,C :set fileencoding=cp932<CR>
