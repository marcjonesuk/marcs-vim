nnoremap <tab> <c-w><c-w>
nnoremap <leader><tab> :tabnext<cr>

" double esc to remove highlighting
nnoremap <silent> <esc><esc> :silent! nohls<cr>

" Window tabs
map <silent> <c-t> :tabnew<cr>
map <silent><leader>q :bdelete<cr>
map <silent><leader>gd :Gdiff<cr>

nnoremap <silent><leader>w :w<cr>

" Move vertically by visual line (on wrapped lines)
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" Move around in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" unmap the command history
map <silent> q: echo<cr>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

noremap <s-j> <NOP>

noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" new splits 
nnoremap <silent> <leader>n :new<cr>
nnoremap <silent> <leader>v :vnew<cr>

" tab/shift-tab indent in visual mode
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

nnoremap <c-c> :qa<cr>
