syntax on

set cindent
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

au BufRead,BufNewFile *.dats set filetype=ats
au BufRead,BufNewFile *.sats set filetype=ats
au BufRead,BufNewFile *.hats set filetype=ats
au BufRead,BufNewFile *.cats set filetype=c

au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.rc set filetype=rust

au BufRead,BufNewFile *.clay set filetype=clay

au BufRead,BufNewFile *.nim set filetype=nimrod

au FileType ruby setlocal nocindent softtabstop=2 shiftwidth=2
au FileType ocaml setlocal nocindent softtabstop=2 shiftwidth=2
au FileType make setlocal nocindent noexpandtab softtabstop=8 shiftwidth=8
