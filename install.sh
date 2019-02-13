#!/bin/bash
echo "Installing marcs-vim..."
type git >/dev/null 2>&1 || { echo >&2 "git not installed.. exiting"; exit 1; }
type curl >/dev/null 2>&1 || { echo >&2 "curl not installed.. exiting"; exit 1; }
DIR=`dirname $0`
mv ~/.vimrc ~/.vimrc_old
ln -s ${DIR}/.vimrc ~/.vimrc
vim


