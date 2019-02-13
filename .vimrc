" https://github.com/marcjonesuk/marcs-vim/

" todo:
" "

set nocompatible

" *** Install Plugin manager  ***
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall 
endif

" autocmd VimEnter *  :source ~/.vim/session
autocmd VimEnter * :CtrlPMRU
" :bnext
"autocmd VimEnter * :PlugUpdate<cr>:q<cr>

" *** Load plugins *** 
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
"  	Plug 'tpope/vim-obsession'
 	Plug 'Yggdroot/indentLine'
"	Plug 'itchyny/lightline.vim'
 	Plug 'vim-airline/vim-airline'
 	Plug 'vim-airline/vim-airline-themes'
 	Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-scripts/xoria256.vim'
  Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
" 	Plug 'SirVer/ultisnips'
" 	Plug 'honza/vim-snippets'
" 	Plug 'phenomenes/ansible-snippets'
	Plug 'mrk21/yaml-vim'
"	Plug 'scrooloose/nerdcommenter'
		Plug 'stephpy/vim-yaml'
" 	Plug 'tpope/vim-vinegar'
" 	Plug 'mbbill/undotree'
	Plug 'w0rp/ale'
" 	Plug 'majutsushi/tagbar'
" 	Plug 'ddrscott/vim-side-search'
	Plug 'terryma/vim-smooth-scroll'
	Plug 'yuttie/comfortable-motion.vim'
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
set scrolloff=10
set autoindent
set splitbelow
set splitright
set nowrap
" set autowrite																						" save buffer when switching
" remembers buffers on exit
"exec 'set viminfo=%,' . &viminfo												

" persistent undo
try
 	set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" *** Search settings *** 
set hlsearch 																				" highlighting on
set incsearch 																			" search as you type
set ignorecase 																			" ignore case for searching
" double esc to remove highlighting
nnoremap <silent> <esc><esc> :silent! nohls<cr>

" vnoremap s y:grep/\V<C-r>=escape(@",'/\') %<CR>:copen<CR>


" *** Display settings ***
syntax enable
set showmatch           " highlight matching [{()}]
set cursorline


" *** Tabs and indentation ***
set showtabline=2
set tabstop=2
set shiftwidth=2


" *** Key mappings ***
nnoremap <silent> <c-f> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <c-b> :call comfortable_motion#flick(-100)<CR>



" Window tabs
map <silent> <tab> :tabnext<cr>
map <silent> <S-tab> :tabprev<cr>
map <silent> <c-t> :tabnew<cr>
map <silent><leader>q :bdelete<cr>
map <silent><leader>gd :Gdiff<cr>

" Ctrl-O Edit
set wildcharm=<C-I>
map <leader>o :edit <c-I>
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
:command Qa qa
:command QA qa
" Session
map <silent> <f9> :SSave <c-I>
map <silent> <f10> :SLoad <c-I>
" Commenting blocks of code.
let b:comment_leader = '# '
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType yaml             let b:comment_leader = '# '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

autocmd FileType yaml :set nowrap

" *** Colorscheme ***
set background=dark
try 
colorscheme xoria256 
catch
endtry	

:command -nargs=+ S :lvim "<args>" % | :lopen  

:map <silent> <leader>s :lvim "<c-r>/" %<cr>:nohlsearch<cr>:lopen<cr>:set nowrap<cr>

" vs code colors
hi Statement ctermfg=139 " 31
hi Comment ctermfg=65
hi Constant ctermfg=173
hi Identifier ctermfg=110
hi Type ctermfg=187
hi Normal ctermfg=251 " ctermbg=234
hi CursorLine ctermbg=236
hi cursorLineNR ctermfg=253
hi Visual ctermbg=25 ctermfg=NONE
hi Search ctermbg=25 ctermfg=251
hi IncSearch ctermbg=25 ctermfg=251
hi Wildmenu ctermbg=25 cterm=NONE ctermfg=white
hi Status ctermbg=253 cterm=NONE
hi StatusLine ctermbg=234 cterm=NONE
hi MatchParen cterm=none ctermfg=139 ctermbg=NONE

hi LineNr ctermbg=234  
highlight EndOfBuffer ctermfg=234 ctermbg=234

" ALE colors
hi ALEErrorSign ctermfg=124 ctermbg=234
hi ALEWarningSign ctermfg=229 ctermbg=234

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

highlight  CursorLine ctermbg=236 ctermfg=None
autocmd InsertEnter * highlight  CursorLine ctermbg=25
autocmd InsertLeave * highlight  CursorLine ctermbg=236 ctermfg=None
autocmd InsertEnter * highlight  CursorLineNR ctermbg=24
autocmd InsertLeave * highlight  CursorLineNR ctermbg=234 ctermfg=None


" *** Plugins ***
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb' 		"ctrlp ordered top to bottom
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1 											" show . files
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_max_height=20
let g:ctrlp_switch_buffer = 0											" disable jumping to window if already open 


" MRU
" map <c-m> :CtrlPMRU<cr>
let NERDTreeShowHidden=1
" NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinPos = "right"
map <f12> :NERDTreeToggle<cr>
let g:NERDTreeMinimalUI = v:true
" close vim if nerdtree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Lightline - show file path in status bar
let g:lightline = {
		  \ 'colorscheme': 'wombat',
			\ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }
set noshowmode						" don't show mode on bottom line

" git gutter
" always show sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
highlight clear SignColumn
highlight GitGutterAdd ctermfg=148 ctermbg=234
highlight GitGutterChange ctermfg=229 ctermbg=234
highlight GitGutterDelete ctermfg=124 ctermbg=234
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=234
set updatetime=100  " faster updates

" fugitive - vertical gdiff
set diffopt+=vertical

" Airline
" :call AirlineTheme powerlineish()
let g:airline_theme='minimalist' "'powerlineish'
