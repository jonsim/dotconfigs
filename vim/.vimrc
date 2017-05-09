syntax on           " Enable synatx highlighting
set ruler           " Enable ruler (column count)
"
" This section has been pulled from
" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/21323445#21323445
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
" For everything else, use a tab width of 4 space chars.
set tabstop=4       " Set TAB width to 4. It is still a \t, just displayed as 4 width.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=0   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set smarttab        " Make TAB go to next indent tabstop when at beginning of line.
