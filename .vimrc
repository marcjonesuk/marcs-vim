" https://github.com/marcjonesuk/marcs-vim/

set nocompatible

" *** Install Plugin manager  ***
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall 
endif

"autocmd VimEnter * :MRU
"autocmd VimEnter * :PlugUpdate<cr>:q<cr>

" *** Load plugins *** 
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
	"Plug 'Yggdroot/indentLine'
	Plug 'itchyny/lightline.vim'
	"Plug 'scrooloose/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-scripts/xoria256.vim'
	Plug 'vim-scripts/mru.vim'
	Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
call plug#end()


" *** General settings ***
set wildmenu
set number 																							" number lines
set mouse=a 																						" mouse enabled
set confirm 																						" confirm save on exit
set nobackup																						" no swap or backup files
set noswapfile
set pastetoggle=<F2>
let mapleader=","
set laststatus=2
set noerrorbells visualbell t_vb=												" no bells
autocmd GUIEnter * set visualbell t_vb=
set ruler
set scrolloff=3
set autoindent


" *** Search settings *** 
set hlsearch 																				" highlighting on
set incsearch 																			" search as you type
set ignorecase 																			" ignore case for searching
" double esc to remove highlighting
nnoremap <silent> <esc><esc> :silent! nohls<cr> 		


" *** Display settings ***
syntax enable
set showmatch           " highlight matching [{()}]
set cursorline


" *** Tabs and indentation ***
set showtabline=2
set tabstop=2
set shiftwidth=2


" *** Key mappings ***
" Window tabs
map <silent> <tab> :tabnext<cr>
map <silent> <S-tab> :tabprev<cr>
map <silent> <c-t> :tabnew<cr>
map <silent> <c-w> :tabclose<cr>
map <silent> <c-q> :SSave current<cr>:qa<cr>
" Ctrl-O Edit
set wildcharm=<C-I>
map <c-o> :edit <c-I>
" Move vertically by visual line (on wrapped lines)
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" Wrap around arrow keys!
set whichwrap+=<,>,h,l,[,]
" Typo commands
:command WQ wq
:command Wq wq
:command W w
:command Q q
" Windows style shortcuts
map <c-z> u
map <c-v> p
map <c-x> x
map <c-c> y
map <c-f> /
map <f3> n
map <c-f3> N
" Session
map <silent> <f9> :SSave <c-I>
map <silent> <f10> :SLoad <c-I>



" *** Colorscheme ***
try 
colorscheme xoria256 
catch
endtry	
set background=dark


" *** Plugins ***
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb' 		"ctrlp ordered top to bottom
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1 											" show . files
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" MRU
let MRU_Window_Height = 20 
map <c-m> :MRU<cr>
let NERDTreeShowHidden=1
" NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinPos = "right"
map <f12> :NERDTreeTabsOpen<cr>
" Lightline - show file path in status bar
let g:lightline = {
			\ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }
