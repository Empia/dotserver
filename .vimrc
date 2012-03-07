    set nocompatible
    filetype off
    filetype plugin indent on

" Interface
    syntax on
    set nonumber
    set encoding=utf-8 nobomb
    set autoindent
    set smartindent
    set wildignore+=*/.git/*,public/system/*,*/log/*,*/tmp/*,.DS_Store,.gitkeep,Gemfile.lock,*.log,*.jpg,*.jpeg,*.gif,*.png,*.pdf
    set showcmd                         " Show (partial) command in the last line of the screen
    set showtabline=1
    set wildmenu                        " Enhance command-line completion
    set esckeys                         " Allow cursor keys in insert mode
    set ttyfast                         " Optimize for fast terminal connections
    set nocursorline
    set guioptions=                     " don't use gui options
    set guifont=Menlo:h18
    set t_Co=256
    set splitbelow
    set splitright
    set hidden                          " this allows to edit several files in the same time without having to save them
    set mouse=a                         " Enable mouse in all modes
    set nostartofline                   " Don’t reset cursor to start of line when moving around.
    set shortmess=atI                   " Don’t show the intro message when starting vim
    set showmode                        " Show the current mode
    set title                           " Show the filename in the window titlebar
    set scrolloff=3                     " Start scrolling three lines before the horizontal window border

    " Disable automatic commenting
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Blinks
        set guicursor=
        set gcr=n:blinkon0      " don't blink in macvim

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
        " set statusline+=\ \
        set statusline+=%{&paste?'[paste]\ ':''}
        "set statusline+=%{&fileencoding}
        set statusline+=\ \ %Y               " type of file
        " set statusline+=\ %3.3(%c%):%3.3(%l%)          " column number
        "set statusline+=\ \%3.3(%l%)     " line / total lines
        "set statusline+=\ \ %2.3p%%          " percentage through file in lines
        "set statusline+=\ \ %{FileSize()}
        set statusline+=%<                   " where truncate if line too long
        set statusline+=\ \ %{CurDir()}


" Shortcuts
    let mapleader = ","

    " Splits

        " creates empty split
            nmap <Leader><left>  :leftabove  vnew<CR>
            nmap <Leader><right> :rightbelow vnew<CR>
            nmap <Leader><up>    :leftabove  new<CR>
            nmap <Leader><down>  :rightbelow new<CR>

        " ,w jumps to the next split
            map <Leader>w <C-w>w

    " Open new files relatively

        cnoremap %% <c-r>=expand('%:h').'/'<cr>
        map <leader>ew :e %%
        "map <leader>es :sp %%
        map <leader>ev :vsp %%
        map <leader>et :tabe %%
        " ,n opens a file in the same directory as the current file
        " map <Leader>n :vnew <C-R>=expand("%:p:h") . '/'<CR>

    " Search stuff

        " <Esc><Esc> clears the search highlight
            nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

        " ,s starts searching
            nnoremap <leader>s :%s//<left>

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

" Environment
    set history=1000 " store lots of :cmdline history

    " Centralize backups, swapfiles and undo history
        set backupdir=~/.vim/backups
        set directory=~/.vim/swaps
        if exists("&undodir")
          set undodir=~/.vim/undo
        endif

    " Load previous session
        " load buffers and all
        " set viminfo='10,\"100,:20,%,n~/.viminfo

        " place cursor on a previous position
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Autoreload .vimrc
        " http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
        if has("autocmd")
          autocmd! bufwritepost .vimrc source $MYVIMRC
        endif

    " Auto change the directory to the current file I'm working on
        " autocmd BufEnter * lcd %:p:h

    " Save on loosing focus
        " au FocusLost * :wa
