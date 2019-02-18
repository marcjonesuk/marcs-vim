" https://github.com/marcjonesuk/marcs-vim/
set nocompatible

set runtimepath+=~/marcs-vim

" *** Install Plugin manager  ***
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall 
endif

source ~/marcs-vim/sensible.vim
source ~/marcs-vim/basics.vim
source ~/marcs-vim/plugins.vim
source ~/marcs-vim/colors.vim 
source ~/marcs-vim/keys.vim
source ~/marcs-vim/statusline.vim
source ~/marcs-vim/insertmode.vim
autocmd FileType qf map <buffer> <Enter> :.cmd FileType qf map <buffer> <Enter> :.cc
