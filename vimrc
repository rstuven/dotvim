set nocompatible

" Enable Pathogen
call pathogen#infect()
call pathogen#helptags()

" Display line numbers
set number

" Incremental search
set incsearch

" Automatic folding
set foldmethod=syntax

" Highlight current line only in insert mode
"autocmd InsertLeave * set nocursorline
"autocmd InsertEnter * set cursorline

" Highlight cursor
highlight CursorLine ctermbg=8 cterm=NONE


" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:_.

set cindent
set smartindent
set autoindent

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Indent/Unindent using TAB
vmap <TAB> >gv
vmap <S-TAB> <gv

" Set encoding
set encoding=utf-8


" Color scheme in 256 colors
set t_Co=256
"colors railscasts
color slate

" CakePHP CTP files syntax highlighting
"autocmd BufEnter *.ctp set syn=php

" Open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree

" Close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


set langmenu=en


set hls

set guifont=Lucida_Console:h8

syntax on
filetype plugin indent on

