call pathogen#infect()
syntax on
filetype plugin indent on
if has('gui_running')
	colorscheme breeze 
else
	colorscheme leo 
endif

let mapleader=","
set nocompatible
set encoding=utf-8
set showcmd   
set nowrap       
set tabstop=2 shiftwidth=2  
set expandtab              
set backspace=indent,eol,start
set hlsearch      
set incsearch    
set ignorecase  
set smartcase 
set tabstop=4
set autoindent
set number
set smartcase
set pastetoggle=<F2>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nmap <silent> ,/ :nohlsearch<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>

cmap w!! w !sudo tee % >/dev/null

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let g:ConqueTerm_Color = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let NERDTreeShowHidden=1
