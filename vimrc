" Environment {
    " Basics {
        set nocompatible        " must be first line
        set noswapfile          " disable swap file creation
        set shell=/bin/sh       " for compatibility with Fish
    " }
" }

" General {

    set background=dark     " Assume a dark background

    " To disable a plugin, add it's bundle name to the following list
    let g:pathogen_disabled = []
    "call add(g:pathogen_disabled, 'nerdtree')

    " Enable Pathogen
    call pathogen#infect()
    call pathogen#helptags()

    " Automatic folding
    set foldmethod=syntax

    " Set encoding
    set encoding=utf-8

    if has ('x') && has ('gui') " on Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui') " one mac and windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    "set mouse=a                 " automatically enable mouse usage
    "set mousehide               " hide the mouse cursor while typing

" }

" Vim UI {

    " Syntax MUST BE on before highlight settings.
    syntax on

    " Color scheme in 256 colors
    set t_Co=256
    colors railscasts
    " Some corrections to color schema
    highlight DiffAdd ctermfg=white ctermbg=green
    highlight Todo ctermfg=white ctermbg=yellow

    set showmode                    " display the current mode

    " Guide column
    set colorcolumn=80
    highlight ColorColumn ctermbg=233

    " Highlight cursor
    "highlight CursorLine ctermbg=8 cterm=NONE
    set cursorline                  " highlight current line

    " Highlight current line only in insert mode
    "autocmd InsertLeave * set nocursorline
    "autocmd InsertEnter * set cursorline

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and selected characters/lines in visual mode
    endif


    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif


    set backspace=indent,eol,start  " backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code
    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
    set guifont=Lucida_Console:h8
    set langmenu=en
    set helplang=en

" }

" Formatting {

    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    "set matchpairs+=<:>                " match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    "autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

    set cindent
    set smartindent
    set autoindent
    set fileformat=unix

    " CakePHP CTP files syntax highlighting
    autocmd BufEnter *.ctp set syn=php

    filetype plugin indent on

" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard location
    let mapleader = ','

    " Indent/Unindent using TAB
    vmap <TAB> >gv
    vmap <S-TAB> <gv

    " Insert a single character
    function! RepeatChar(char, count)
        return repeat(a:char, a:count)
    endfunction
    nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
    "nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h
    map gj <C-W>j<C-W>_
    map gk <C-W>k<C-W>_
    map gl <C-W>l:vertical res<CR>
    map gh <C-W>h:vertical res<CR>

    " Stupid shift key fixes
    cmap W w
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    """ Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>


    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Ctrl-Q to quit as recommended here in http://stackoverflow.com/a/7884226/149444
    silent !stty -ixon > /dev/null 2>/dev/null
    nmap <C-Q> :quit<CR>

" }

" Plugins {

    " PIV {
        let g:DisableAutoPHPFolding = 1
        let g:PIVAutoClose = 0
    " }

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags
    " }

    " EasyTags {
        let g:easytags_cmd = 'ctags'
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " SnipMate {
        " Setting the author var
        " If forking, please overwrite in your .vimrc.local file
        let g:snips_author = 'Steve Francia <steve.francia@gmail.com>'
        " Shortcut for reloading snippets, useful when developing
        nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=1
        let NERDTreeQuitOnOpen=0
        let NERDTreeShowHidden=0
        let NERDTreeKeepTreeInNewTab=1

        " Open a NERDTree automatically when vim starts up
        "autocmd vimenter * NERDTree

        " Close vim if the only window left open is a NERDTree
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    " }

    " NerdTreeTabs {
        map <Leader>n <plug>NERDTreeTabsToggle<CR>
    " }

    " Tabularize {
        if exists(":Tabularize")
          nmap <Leader>a= :Tabularize /=<CR>
          vmap <Leader>a= :Tabularize /=<CR>
          nmap <Leader>a: :Tabularize /:<CR>
          vmap <Leader>a: :Tabularize /:<CR>
          nmap <Leader>a:: :Tabularize /:\zs<CR>
          vmap <Leader>a:: :Tabularize /:\zs<CR>
          nmap <Leader>a, :Tabularize /,<CR>
          vmap <Leader>a, :Tabularize /,<CR>
          nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
          vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

          " The following function automatically aligns when typing a
          " supported character
          inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

          function! s:align()
              let p = '^\s*|\s.*\s|\s*$'
              if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
                  let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                  let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                  Tabularize/|/l1
                  normal! 0
                  call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
              endif
          endfunction

        endif
    " }

    " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
    " }

    " Buffer explorer {
        nmap <leader>b :BufExplorer<CR>
    " }

    " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    " }

    " PyMode {
        let g:pymode_lint_checker = "pyflakes"
    " }

    " ctrlp {
        let g:ctrlp_working_path_mode = 2
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
    "}

    " TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    "}

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>zR<C-w>20+
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    "}

    " checksyntax {
        if !exists('g:checksyntax')
            let g:checksyntax = {}
        endif
        if executable('jshint')
            let g:checksyntax['javascript'] = {
                \ 'cmd': 'jshint'
                \ }
        endif
    " }

    " Powerline {
        let g:Powerline_symbols = 'fancy'
    " }

" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

