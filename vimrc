syntax on
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set showcmd
"filetype on
"filetype plugin on
"set autoindent
"set number

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
set encoding=utf8
