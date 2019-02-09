#!/bin/bash
echo "Installing..."
DIR=`dirname $0`
mv ~/.vimrc ~/.vimrc_old
ln -s ${DIR}/.vimrc ~/.vimrc
vim
