call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-obsession'
 	Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'mrk21/yaml-vim'
"	Plug 'scrooloose/nerdcommenter'
		Plug 'stephpy/vim-yaml'
" 	Plug 'tpope/vim-vinegar'
" 	Plug 'mbbill/undotree'
	Plug 'w0rp/ale'
  Plug 'mileszs/ack.vim'
  Plug 'mhinz/vim-startify'
	Plug 'simnalamburt/vim-mundo'
	Plug 'junegunn/seoul256.vim'
	Plug 'wikitopian/hardmode'
	Plug 'pseewald/vim-anyfold'
 	Plug 'Yggdroot/indentLine'
	Plug 'chriskempson/base16-vim'
	Plug 'altercation/vim-colors-solarized'
	Plug 'SirVer/ultisnips'
	Plug 'phenomenes/ansible-snippets'
call plug#end() 

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb' 		"ctrlp ordered top to bottom
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1 											" show . files
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_max_height=15
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
" let g:lightline = {
" 		  \ 'colorscheme': 'wombat',
" 			\ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
"       \ }
"       \ }

" git gutter
" always show sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" fugitive - vertical gdiff
set diffopt+=vertical

" Airline
" :call AirlineTheme powerlineish()
let g:airline_theme='minimalist' "'powerlineish'
"let g:airline_theme='powerlineish'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

function Search(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute 'Ack!' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction

:command -nargs=+ FindInFiles :Ack! <args> 
nnoremap <leader>/ :FindInFiles<SPACE>
nnoremap <leader>\ :FindInFiles<space>
noremap \ :FindInFiles<space>
:command -nargs=+ FindAndReplace :%s/<args>/gc
nnoremap <leader>ff :FindInFiles<space>
nnoremap <leader>fr :FindAndReplace<space>
nnoremap <c-m> :CtrlPMRU<cr>
" nnoremap <c-p> :CtrlPMixed<cr>

" don't open CtrlPMRU when in a quickfix or location window
autocmd FileType qf map <buffer> <Enter> :.cc<cr> 

" let g:mundo_map_move_older: "Down"
" let g:mundo_map_move_newer: "Up"
let g:UltiSnipsSnippetsDir="~/marcs-vim/my-snippets"
let g:UltiSnipsSnippetDirectories=["my-snippets", "UltiSnips"]

