" Set colorscheme
colorscheme nord

" Basic settings
set background=dark
set clipboard=unnamed,unnamedplus
set completeopt=menu,menuone,noselect
set expandtab
set mouse=a
set number
set relativenumber
set shiftwidth=2
set ignorecase
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set termguicolors
set timeoutlen=300
set undofile
set cursorline
set linebreak
set scrolloff=5
set sidescrolloff=8

" Additional settings that might be useful
set incsearch
set laststatus=2
set wildmenu
set wildmode=longest:full,full
set hidden
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key to space
let mapleader = " "
let maplocalleader = " "

" Disable default keymap
nnoremap q <Nop>

" Prevent copy on press x
nnoremap x "_x

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Manipulating tabs and buffer
nnoremap <S-h> :tabp<CR>
nnoremap <S-l> :tabn<CR>
nnoremap <leader>bd :bdelete<CR>

" Disable highlight
nnoremap <leader>ch :nohl<CR>

" Manipulating splits
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s
nnoremap <leader>se <C-w>=
nnoremap <leader>sx :close<CR>

" Press jk fast to enter normal mode
inoremap jk <ESC>

" Move text in visual block mode
xnoremap H <gv
xnoremap J :move '>+1<CR>gv=gv
xnoremap K :move '<-2<CR>gv=gv
xnoremap L >gv
