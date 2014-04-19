" -----------------------------------------------------------------------------
" BASICS
" -----------------------------------------------------------------------------

    set nocompatible
    filetype off

" Setup vundle
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

" Register bundles
    Bundle 'gmarik/vundle'
    Bundle 'kien/ctrlp.vim'
    Bundle 'mattn/emmet-vim'
    Bundle 'othree/html5.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'tpope/vim-abolish'
    Bundle 'tpope/vim-commentary'
    Bundle 'tpope/vim-eunuch'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-git'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-sensible'
    Bundle 'tpope/vim-surround'
    Bundle 'bling/vim-airline'

" Manually load vim-sensible defaults to enable overriding
    runtime! plugin/sensible.vim

" Basic configs
    set hidden
    set nowrap
    set number
    set ruler
    set showmatch
    set listchars="eol:$"
    set undofile
    set undodir^=~/.vim/undo
    set noshowcmd
    set noshowmode
    set clipboard=unnamed
    set smartindent

" Open splits below and to the right
    set splitbelow
    set splitright

" Solarized
    let g:solarized_termtrans = 1

" Enable filetype detection
    filetype plugin indent on

" Enable sintax highlighting
    syntax enable

" Set the color scheme.
    set background=dark
    colorscheme solarized

    if has('gui_macvim')
        set guioptions-=m
        set guioptions-=T
        set guifont=Menlo\ for\ Powerline:h14
    endif

" Configure completion
    set complete=.,i,d,t
    set completeopt=menuone
    set wildmenu
    set wildmode=list:longest
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,env/*

" Configure tabs
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    set smarttab

" Set leader to ,
    let mapleader=","

" Shortmess settings:
" f - use "(3 of 5)" instead of "(file 3 of 5)"
" i - use "[noeol]" instead of "[Incomplete last line]"
" l - use "999L, 888C" instead of "999 lines, 888 characters"
" m - use "[+]" instead of "[Modified]"
" n - use "[New]" instead of "[New File]"
" r - use "[RO]" instead of "[readonly]"
" x - use "[dos]" instead of "[dos format]", "[unix]" instead of "[unix
" format]", and "[mac]" instead of "[mac format]"
" t - truncate file message at the start if it is too long to fit on the
" command-line, "<" will appear in the left most column.
" T - trunctate other messages in the middle if they are too long to fit on
" the command line. "..." will appear in the middle.
" I - don't give the intro message when starting Vim.
    set shortmess=filmnrxtTI

" -----------------------------------------------------------------------------
" FILE TYPES
" -----------------------------------------------------------------------------

" Edit and source vimrc quickly
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>

" Settings for C
    autocmd filetype c compiler gcc

" Settings for Go, Octave
    autocmd BufRead,BufNewFile *.go setfiletype go
    autocmd BufRead,BufNewFile *.m setfiletype octave

" Settings for Ruby
    autocmd BufRead,BufNewFile *.ru,Vagrantfile,Guardfile setfiletype ruby
    autocmd filetype ruby,eruby setlocal shiftwidth=2 softtabstop=2 tabstop=2

" -----------------------------------------------------------------------------
" SEARCH
" -----------------------------------------------------------------------------

    set ignorecase " Make searches case-insensitive...
    set smartcase  " ...unless they contain upper-case letters
    set infercase
    set hlsearch
    set gdefault   " Apply substitutions globally by default

" Fix & command, preserving flags
    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

" Map ,<space> to clear search highlight
    nnoremap <leader><space> :noh<cr>

" Maps <F3> to search and replace
    nnoremap <F3> :%s/
    inoremap <F3> <ESC>:%s/

" -----------------------------------------------------------------------------
" MISCELLANEOUS
" -----------------------------------------------------------------------------

    set pastetoggle=<F2> " Quickly enable paste mode

" Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Correct indentation after opening a phpdocblock and automatic * on every line
    set formatoptions=croqw2

" Configure %% as an expression that returns the current file directory
    cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Restore comma function
    noremap \ ,

" Disable arrow keys in normal mode
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>

" Map j, k and J to saner versions
    nnoremap j gj
    nnoremap k gk
    nnoremap gJ J
    nnoremap J gJ
    vnoremap j gj
    vnoremap k gk
    vnoremap gJ J
    vnoremap J gJ

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" Disable slow syntax checking in HTML files
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['html'] }

    let g:syntastic_check_on_open=1

" NERDCommenter settings
    let NERDSpaceDelims=1

" Go Plugin
    set rtp+=$GOROOT/misc/vim

" CtrlP
    let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/](\.git|\.hg|\.svn|env)$',
     \ 'file': '\v\.pyc',
     \ 'link': '',
     \ }

" Airline
    let g:airline_powerline_fonts=1
    let g:airline_theme='light'
    let g:airline_enable_branch=1

    function! s:MkNonExDir(file, buf)
        if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
            let dir=fnamemodify(a:file, ':h')
            if !isdirectory(dir)
                call mkdir(dir, 'p')
            endif
        endif
    endfunction

    augroup BWCCreateDir
        autocmd!
        autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    augroup END

    let g:gist_clip_command = 'pbcopy'
    let g:gist_detect_filetype = 1
    let g:gist_open_browser_after_post = 1
