execute pathogen#infect()
syntax on
filetype plugin indent on 

if has('gui_running')
    set background=light
else
    set background=dark
endif

set rtp+=/opt/homebrew/lib/python3.9/site-packages/powerline/bindings/bindings/vim

set cursorline
hi CursorLine term=underline cterm=underline gui=underline

let mapleader=","
set encoding=utf-8
set showcmd   
set nowrap
set linebreak
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
set clipboard=unnamed
set t_Co=256

 
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
 
set laststatus=2 
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode 

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <leader>f :NERDTreeToggle<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

MapToggle <F1> hlsearch
MapToggle <F2> wrap
MapToggle <F3> list 
MapToggle <F4> ignorecase
MapToggle <F5> paste
set pastetoggle=<F5>
