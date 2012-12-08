set nocompatible
filetype on
filetype plugin indent on

syntax on
set nonumber
set encoding=utf-8 nobomb
set autoindent
set smartindent
set wildignore+=*~,*/log/*,*/tmp/*,*/.git/objects/*,*/public/system/*,*.jpg,*.jpeg,*.gif,*.png,*.pdf,*.mp3
set showcmd                         " Show (partial) command in the last line of the screen
set showtabline=1
set wildmenu                        " Enhance command-line completion
set ttyfast                         " Optimize for fast terminal connections
set nocursorline
set t_Co=256
set splitbelow
set splitright
set hidden                          " this allows to edit several files in the same time without having to save them
set nostartofline                   " Don’t reset cursor to start of line when moving around.
set shortmess=atI                   " Don’t show the intro message when starting vim
set showmode                        " Show the current mode
set scrolloff=3                     " Start scrolling three lines before the horizontal window border
set shell=bash
set lazyredraw

set history=1000
set nobackup
set nowritebackup
set noswapfile

set esckeys
set ttimeout
set ttimeoutlen=1
set timeoutlen=500

" Beeps n errors
    set visualbell " Use visual bell instead of beeping
    set t_vb=
    set noerrorbells

" Don’t add empty newlines at the end of files
    set binary
    set noeol

" Brackets
    let loaded_matchparen=1         " Don't jump to paired brackets
    set noshowmatch

" Search
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase                   " Override the 'ignorecase' if the search pattern contains upper case characters
    set gdefault

    " This turns off Vim’s crazy default regex characters and makes searches use normal regexes.
    nnoremap / /\v
    vnoremap / /\v

" Whitespace
    set nowrap
    set tabstop=2 shiftwidth=2 softtabstop=2  " A tab is two spaces
    set expandtab                             " Use spaces
    set backspace=indent,eol,start            " Backspace through everything in insert mode

" Statusline
    function! FileSize()
        let bytes = getfsize(expand("%:p"))
        if bytes <= 0
            return ""
        endif
        if bytes < 1024
            return bytes . "B"
        else
            return (bytes / 1024) . "K"
        endif
    endfunction

    function! CurDir()
        return expand('%:p:~')
    endfunction

    set laststatus=2
    set statusline=\
    set statusline+=%n:\                 " buffer number
    set statusline+=%t                   " filename with full path
    set statusline+=%m                   " modified flag
    set statusline+=%{&paste?'[paste]\ ':''}
    set statusline+=\ \ %Y               " type of file
    set statusline+=%<                   " where truncate if line too long
    set statusline+=\ \ %{CurDir()}

" Bindings
    let mapleader = ","

    " Save & quit
        map <Leader>w :w!<CR>
        imap <Leader>w <Esc>:w!<CR>
        map <Leader>q :q<CR>
        imap <Leader>q <Esc>:q<CR>

    " Netrw
        nmap - :Explore<cr>

    " Switch between the currently open buffer and the previous one
        nnoremap <Leader><Leader> <c-^>

    " Switch windows
        nmap <C-h> <C-W>h
        nmap <C-j> <C-W>j
        nmap <C-k> <C-W>k
        nmap <C-l> <C-W>l

    " Open new files relatively
        cnoremap %% <c-r>=expand('%:h').'/'<cr>

        " ,n opens a file in the same directory as the current file
            map <Leader>n :vnew <C-R>=expand("%:p:h") . '/'<CR>

    " Search stuff
        " <Esc><Esc> clears the search highlight
            nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

        " ,s starts searching
            nnoremap <Leader>s :%s//<left>
            vnoremap <Leader>s :s//<left>

        " keep search results centered
            nmap n nzz
            nmap N Nzz
            nmap * *zz
            nmap # #zz
            nmap g* g*zz
            nmap g# g#zz

    " < > shifts blocks without loosing focus
        vnoremap < <gv
        vnoremap > >gv

    " ,v reselects previously pasted text
        nnoremap <leader>v V`]

    " jj quits insert mode
        inoremap jj <ESC>

    " Y yanks till end of line
        map Y y$

    " Fix Trailing White Space
        map <leader>ts :%s/\s\+$//e<CR>
