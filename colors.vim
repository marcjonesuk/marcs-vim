
" *** Colorscheme *** 
set background=dark 
try 
" 	colorscheme xoria256 
		colorscheme Tomorrow-Night
catch 
endtry	
:command -nargs=+ S :lvim "<args>" % | :lopen  
:map <silent> <leader>s :lvim "<c-r>/" %<cr>:nohlsearch<cr>:lopen<cr>:set nowrap<cr> 

" vs code colors 
" hi Statement ctermfg=139 " 31 
hi Comment ctermfg=65 cterm=NONE
hi Constant ctermfg=173 cterm=NONE
" hi Identifier ctermfg=110 cterm=NONE
" hi Type ctermfg=187 cterm=NONE
" hi Normal ctermfg=251 " ctermbg=234 cterm=NONE
" hi CursorLine ctermbg=236 cterm=NONE
hi cursorLineNR ctermfg=242 cterm=NONE ctermbg=236
" hi Visual ctermbg=130 ctermfg=NONE cterm=NONE
" hi Search ctermbg=25 ctermfg=251 cterm=NONE
" hi IncSearch ctermbg=25 ctermfg=251 cterm=NONE
" hi Wildmenu ctermbg=25 cterm=NONE ctermfg=white cterm=NONE
" hi Status ctermbg=253 cterm=NONE cterm=NONE
" hi StatusLine ctermbg=234 cterm=NONE cterm=NONE
" hi MatchParen cterm=none ctermfg=139 ctermbg=NONE cterm=NONE
" 
" hi LineNr ctermbg=234  
" highlight EndOfBuffer ctermfg=234 ctermbg=234
" 
" " ALE colors
" hi ALEErrorSign ctermfg=124 ctermbg=234
" hi ALEWarningSign ctermfg=229 ctermbg=234
" 
" 
" hi Folded ctermbg=235 ctermfg=242
" 
highlight clear SignColumn
highlight GitGutterAdd ctermfg=148 " ctermbg=234
highlight GitGutterChange ctermfg=243 " ctermbg=234
highlight GitGutterDelete ctermfg=124 " ctermbg=234
highlight GitGutterChangeDelete ctermfg=yellow " ctermbg=234
" 

" highlight matching words
" highlight WordMatch ctermbg=237
" :autocmd CursorMoved * exe printf('match WordMatch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" let g:no_highlight_group_for_current_word=["Statement", "Comment", "Type", "PreProc"]
" function s:HighlightWordUnderCursor()
"     let l:syntaxgroup = synIDattr(synIDtrans(synID(line("."), stridx(getline("."), expand('<cword>')) + 1, 1)), "name")
" 		echo l:syntaxgroup
"     if (index(g:no_highlight_group_for_current_word, l:syntaxgroup) == -1)
"         exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
"     else
"         exe 'match IncSearch /\V\<\>/'
"     endif
" endfunction
" 
" autocmd CursorMoved * call s:HighlightWordUnderCursor() 

" " highlight StatusLine ctermbg=53
