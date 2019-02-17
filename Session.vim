let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/marcs-vim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Documents/projects/test/node_modules/rxbot/test.js
badd +33777 ~/Documents/projects/rxbottest/node_modules/typo-js/dictionaries/en_US/en_US.dic
badd +1 ~/marcs-vim/install.sh
badd +1 ~/marcs-vim/basics.vim
badd +56 ~/.vim/plugged/vim-sensible/plugin/sensible.vim
badd +1 ~/.vim_runtime/vimrcs/plugins_config.vim
badd +10 ~/marcs-vim/test
badd +63 ~/marcs-vim/colors.vim
badd +9 ~/marcs-vim/statusline.vim
badd +1 ~/.vim/colors/xoria.vim
badd +11 ~/marcs-vim/insertmode.vim
badd +13 ~/marcs-vim/.vimrc
badd +1 ~/marcs-vim/ftplugin/yaml.vim
badd +1 ~/marcs-vim/sensible.vim
argglobal
silent! argdel *
edit ~/marcs-vim/basics.vim
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 88 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 89 + 89) / 178)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 109 - ((49 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
109
normal! 036|
wincmd w
argglobal
if bufexists('~/marcs-vim/sensible.vim') | buffer ~/marcs-vim/sensible.vim | else | edit ~/marcs-vim/sensible.vim | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 40 - ((39 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 88 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 89 + 89) / 178)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
