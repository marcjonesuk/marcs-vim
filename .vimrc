set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall 
endif

syntax enable
set background=dark

set laststatus=2

filetype indent on      " load filetype-specific indent files
set showmatch           " highlight matching [{()}]
set lazyredraw          " redraw only when we need to.

set wildmenu
"set wildmode=longest:list,full
source $VIMRUNTIME/menu.vim
set showtabline=2
set number
set mouse=a
set backspace=indent,eol,start
set cursorline
set confirm

" move vertically by visual line (on wrapped lines)
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

let mapleader=","

set tabstop=2
set shiftwidth=2
let MRU_Window_Height = 20 
map <c-m> :MRU<cr>
let NERDTreeShowHidden=1
set wildcharm=<C-I>
map <c-o> :edit <c-I>
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinPos = "right"
let g:ctrlp_show_hidden = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

map <f12> :NERDTreeTabsOpen<cr>

" Window tabs
map <silent> <tab> :tabnext<cr>
map <silent> <S-tab> :tabprev<cr>
map <silent> <c-t> :tabnew<cr>
map <silent> <c-w> :tabclose<cr>
map <silent> <c-q> :q<cr>

" Typo commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" load plugins
call plug#begin('~/.vim/plugged')

"Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
"Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'vim-scripts/mru.vim'

call plug#end()

try 
colorscheme xoria256 
catch
endtry	

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb' "ctrlp top to bottom
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'

map <c-z> u
map <c-v> p
map <c-x> x
map <c-c> y
map <c-f> /
map <f3> n
map <c-f3> N

" Search settings
set hlsearch " highlighting on
set incsearch " search as typing
set ignorecase " ignore case for searching
nnoremap <silent> <esc><esc> :silent! nohls<cr> " double esc to remove highlighting

" No swap files
set nobackup
set noswapfile

set pastetoggle=<F2>


"vim sensible

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=3
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

