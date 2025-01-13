let $BPATH=$BREWPATH
call plug#begin('~/.vim/plugins/')
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-eunuch'
 Plug 'scrooloose/nerdtree'
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/fzf'
 Plug '$HOME/.local/pipx/venvs/powerline-status/lib/python3.12/site-packages/powerline/bindings/vim'
 Plug 'ryanoasis/vim-devicons'
call plug#end()

if has('gui_running')
    set background=light
    set guifont=Hack\ Regular\ Nerd\ Font\ Complete:h12
  else
    set background=dark
endif

set cursorline
hi CursorLine term=underline cterm=underline gui=underline

let mapleader=","
set nocompatible
set encoding=utf-8
set nowrap
set linebreak
set tabstop=2
set shiftwidth=2
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
set t_Co=256
set list
set listchars=tab:▸\ ,trail:·
set wildmode=longest:full,full
set laststatus=2

if ! has('gui_running')
   set ttimeoutlen=10
   set noshowmode
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

let $FZF_DEFAULT_OPTS .= ' --inline-info'
if exists('$TMUX')
let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <leader>f :FZF<CR>
map <leader>vr :source ~/.vimrc<CR>
map <leader>n :NERDTreeToggle<CR>

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
MapToggle <F6> spell
