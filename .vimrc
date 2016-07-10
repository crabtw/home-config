set nocompatible
set ruler

set expandtab
set softtabstop=4
set shiftwidth=4

set fileformat=unix
set fileformats=unix,dos,mac

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,latin1

set hlsearch
colorscheme torte

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'jvoorhis/coq.vim'
Plugin 'idris-hackers/idris-vim'
Plugin 'crabtw/my.vim'

call vundle#end()

filetype plugin indent on
syntax on
