" https://github.com/marcjonesuk/marcs-vim/

set nocompatible

" *** Install Plugin manager  ***
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall 
endif

autocmd VimEnter * :CtrlPMRU
"autocmd VimEnter * :PlugUpdate<cr>:q<cr>

" *** Load plugins *** 
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
	Plug 'Yggdroot/indentLine'
	"Plug 'itchyny/lightline.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'scrooloose/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-scripts/xoria256.vim'
" 	Plug 'vim-scripts/mru.vim'
" 	Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'phenomenes/ansible-snippets'
	Plug 'mrk21/yaml-vim'
"	Plug 'scrooloose/nerdcommenter'
"   Plug 'pangloss/vim-javascript'
	Plug 'stephpy/vim-yaml'
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
set splitbelow
set splitright
set autowrite																						" save buffer when switching

" persistent undo
" try
"     set undodir=~/.vim_runtime/temp_dirs/undodir
"     set undofile
" catch
" endtry

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

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" *** Tabs and indentation ***
set showtabline=2
set tabstop=2
set shiftwidth=2


" *** Key mappings ***
" Window tabs
map <silent> <tab> :bnext<cr>
map <silent> <S-tab> :bprev<cr>
map <silent> <c-t> :tabnew<cr>
map <silent> <c-q> :bdelete<cr>
map <leader><tab> <c-w><c-w>
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
map <c-v> p
map <c-x> x
map <c-c> y
map <c-f> /
map <f3> n
map <c-f3> N
" Session
map <silent> <f9> :SSave <c-I>
map <silent> <f10> :SLoad <c-I>
" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType yaml             let b:comment_leader = '# '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" *** Colorscheme ***
set background=dark
try 
colorscheme xoria256 
catch
endtry	

" vs code colors
hi Statement ctermfg=139 " 31
hi Comment ctermfg=65
hi Constant ctermfg=173
hi Identifier ctermfg=110
hi Type ctermfg=187
hi Normal ctermfg=251
hi CursorLine ctermbg=236
hi cursorLineNR ctermfg=253
hi Visual ctermbg=25 ctermfg=NONE
hi Search ctermbg=130

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


" *** Plugins ***
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb' 		"ctrlp ordered top to bottom
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1 											" show . files
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_max_height=20

" MRU
let MRU_Window_Height = 20 
map <c-m> :CtrlPMRU<cr>
let NERDTreeShowHidden=1
" NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinPos = "right"
map <f12> :NERDTreeToggle<cr>
" Lightline - show file path in status bar
let g:lightline = {
			\ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }
set noshowmode						" dont show mode on bottom line
" git gutter
" always show sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
set updatetime=100  " faster updates

" fugitive - vertical gdiff
set diffopt+=vertical

" Airline
" :call AirlineTheme powerlineish()
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1		" show buffers instead of tabs

