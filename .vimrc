set nu                                " line numbering
set tabstop=4 shiftwidth=4 expandtab  " tab stuff
set ai                                " auto-indenting
set hlsearch                          " highlight the last searched term
colorscheme evening 

"set softtabstop=4

:set hidden
:set title
let &titleold="Terminal"

if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
