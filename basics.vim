" *** General settings ***
set wildmenu
set wildignore=*.retry
set number 																							" number lines
set confirm 																						" confirm save on exit
set nobackup																						" no swap or backup files
set noswapfile
set pastetoggle=<F2>
let mapleader=","
set laststatus=2
set noerrorbells visualbell t_vb=												" no bells
autocmd GUIEnter * set visualbell t_vb=
set ruler
set scrolloff=5
set autoindent
set copyindent
set splitbelow
set splitright
set nowrap
" set relativenumber
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

" vnoremap s y:grep/\V<C-r>=escape(@",'/\') %<CR>:copen<CR>
 
" *** Display settings ***
syntax enable
set showmatch           " highlight matching [{()}]
set cursorline


" *** Tabs and indentation ***
set showtabline=2
set tabstop=2
set shiftwidth=2

highlight Folded ctermbg=234 ctermfg=233
set foldmethod=indent
" set fillchars=fold:\—													" removes the trailing ---- in a fold line

" Ctrl-O Edit
set wildcharm=<C-I>
" map <leader>o :edit <c-I>
" Wrap around arrow keys!
set whichwrap+=<,>,h,l,[,]
" Typo commands
:command WQ wq
:command Wqa wqa
:command WQa wqa
:command WQA wqa
:command Wq wq
:command W w
:command Q q
:command Qa qa
:command QA qa

" Commenting blocks of code.
let b:comment_leader = '# '
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType yaml             let b:comment_leader = '# '

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%#LineNr#
" set statusline+=\ %f
" set statusline+=%m\
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" 
" set statusline+=%#StatusLine#
" 
" " set statusline+=\ sjkhfdkjhf
" 
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c

nnoremap <silent> <leader>z :tab split<cr>
set updatetime=100  " faster updates

set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
set list
