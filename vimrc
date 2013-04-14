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
    Bundle 'Jinja'
    Bundle 'SirVer/ultisnips'
    Bundle 'airblade/vim-gitgutter'
    Bundle 'jergason/scala.vim'
    Bundle 'kana/vim-textobj-user'
    Bundle 'kana/vim-textobj-lastpat'
    Bundle 'kien/ctrlp.vim'
    Bundle 'mattn/zencoding-vim'
    Bundle 'mileszs/ack.vim'
    Bundle 'myusuf3/numbers.vim'
    Bundle 'nelstrom/vim-visual-star-search'
    Bundle 'octave.vim--'
    Bundle 'othree/html5.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'sjl/gundo.vim'
    Bundle 'tpope/vim-abolish'
    Bundle 'tpope/vim-commentary'
    Bundle 'tpope/vim-eunuch'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-haml'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-sensible'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-unimpaired'

" Manually load vim-sensible defaults to enable overriding
    runtime! plugin/sensible.vim

" Basic configs
    set hidden
    set nowrap
    set number
    set ruler
    set showmatch
    set listchars="eol:$"

" Enable filetype detection
    filetype plugin indent on

" Enable sintax highlighting
    syntax enable

" Set the color scheme.
    set background=dark
    colorscheme Tomorrow-Night

    if has('gui_macvim')
        set guifont=Monaco:h13
    elseif match(system("uname"), "Darwin") > -1
        colorscheme Tomorrow-Night-Terminalapp
    endif

" Configure completion
    set complete=.,i,d,t
    set completeopt=menuone
    set wildmode=longest,list:longest
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,env/*

" Do not display menu and toolbar in gVim
    set guioptions-=mT

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

" Use normal regex handling to search and replace
    nnoremap / /\v
    vnoremap / /\v

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

" Python-mode
    let g:pymode_folding = 0

" Zencoding
    let g:user_zen_expandabbr_key = '<c-e>'
    let g:use_zen_complete_tag = 1

" CtrlP
    let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/](\.git|\.hg|\.svn|env)$',
     \ 'file': '\v\.pyc',
     \ 'link': '',
     \ }

" UltiSnips
    let g:UltiSnipsExpandTrigger='<tab>'
    let g:UltiSnipsJumpForwardTrigger='<tab>'
    let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
