augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
" 
" highlight  CursorLine ctermbg=236 ctermfg=None
autocmd InsertEnter * highlight CursorLine ctermbg=25
autocmd InsertLeave * highlight CursorLine ctermbg=236 
autocmd InsertEnter * highlight CursorLineNR ctermbg=24 ctermfg=246
autocmd InsertLeave * highlight CursorLineNR ctermbg=236 ctermfg=242 
