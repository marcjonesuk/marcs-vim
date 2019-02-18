hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=234
hi StatColor2 ctermbg=166 ctermfg=white
hi Modified guibg=orange guifg=black ctermbg=lightgreen ctermfg=black

hi CustomStatusLine ctermbg=239
hi CustomStatusLineNC ctermbg=237
hi Test ctermbg=lightgreen ctermfg=black

function! MyStatusLine(mode)
  let statusline=""
	
	try
 		let m = mode()
"  		highlight CursorLineNR ctermbg=236 
 		if m == 'V'
" 			highlight CursorLineNR ctermbg=166 

 			if m != g:last_mode
"  				redraw
 			endif
 		endif
		if a:mode == 'Enter'
      let statusline.="%#StatColor#"
    endif
		if m == 'v'
			let statusline.="%#StatColor2#"
		endif
    let statusline.=" %f "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
  
		if a:mode == 'Enter'
 			let statusline.="%#CustomStatusLine#"
		endif
		
		if a:mode == 'Leave'
			let statusline.="%#CustomStatusLineNC#"
		endif
" 		let statusline.="%{StatuslineGit()}"
" 		if a:mode == 'Leave'
"         let statusline.="%*%r"
"     elseif a:mode == 'Enter'
"         let statusline.="%r%*"
"      endif
 
		if a:mode == 'Enter'
	"     let statusline .= StatuslineGit()
			let statusline .= "\ Ln %l/%L,\ Col %c\ %=%h%w\ %r %m %Y "
			if m == 'v'
				let statusline .= "%#StatColor2# %p%% "
			else
				let statusline .= "%#StatColor# %p%% "
			endif
  	endif 
  	
  	if a:mode == 'Leave'	
			let statusline .= "\ %=%h%w\ %r %m"
   	endif
		let g:last_mode = m
    return statusline
	catch
		echo "error"
	endtry
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
" 	let mode=mode()
" 	echo mode
	if a:mode == 'i'
		hi StatColor guibg=orange ctermbg=25 ctermfg=white
	elseif a:mode == 'r'
		hi StatColor guibg=#e454ba ctermbg=magenta
	elseif a:mode == 'v'
		hi StatColor guibg=#e454ba ctermbg=130
	else
		hi StatColor guibg=red ctermbg=red
	endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

set noshowmode						" don't show mode on bottom line
