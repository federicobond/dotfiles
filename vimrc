" -----------------------------------------------------------------------------
" BASICS
" -----------------------------------------------------------------------------

" Register bundles
    call plug#begin('~/.vim/plugged')

    " Plug 'Valloric/YouCompleteMe'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'leafgarland/typescript-vim'
    " Plug 'marijnh/tern_for_vim'
    Plug 'mattn/emmet-vim'
    Plug 'mxw/vim-jsx'
    Plug 'nanotech/jellybeans.vim'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'rking/ag.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'tomlion/vim-solidity'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-git'
    Plug 'tpope/vim-markdown'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'unblevable/quick-scope'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'w0rp/ale'

    call plug#end()

" Manually load vim-sensible defaults to enable overriding
    runtime! plugin/sensible.vim

" Basic configs
    set hidden
    set nowrap
    set number
    set relativenumber
    set showmatch
    set undofile
    set undodir^=~/.vim/undo
    set noshowcmd

" Open splits below and to the right
    set splitbelow
    set splitright

" Set the color scheme.
    colorscheme jellybeans

" Configure completion
    set complete=.,i,d,t
    set completeopt=menuone
    set wildmenu
    set wildmode=list:longest
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,env/*,node_modules/**

" Configure tabs
    set expandtab
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
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

" Settings for Go
    autocmd BufRead,BufNewFile *.go setfiletype go
    autocmd filetype go setlocal noexpandtab

" Settings for Ruby
    autocmd BufRead,BufNewFile *.ru,Vagrantfile,Guardfile setfiletype ruby
    autocmd filetype ruby,eruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
    autocmd filetype ruby nmap <leader>d Orequire "debugger"; debugger<ESC>:w<CR>

" Settings for Python
    autocmd filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=4
    autocmd filetype python nmap <leader>d Oimport ipdb; ipdb.set_trace()<ESC>:w<CR>

" Settings for Javascript
    autocmd filetype javascript nmap <leader>d Odebugger;<ESC>:w<CR>

" Settings for Java
    autocmd filetype java setlocal shiftwidth=4 softtabstop=4 tabstop=4

" Settings for markdown
    autocmd filetype markdown set wrap

" Settings for Haskell, Elm
    autocmd filetype haskell,elm setlocal shiftwidth=4 softtabstop=4 tabstop=4

" Settings for WordPress
    autocmd BufRead,BufNewfile */wp-content/* setlocal noexpandtab

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

" -----------------------------------------------------------------------------
" MISCELLANEOUS
" -----------------------------------------------------------------------------

    set pastetoggle=<F2> " Quickly enable paste mode

" Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Correct indentation after opening a phpdocblock and automatic * on every line
    set formatoptions+=croqw2

" Restore comma function
    noremap \ ,

" Map j, k and J to saner versions
    nnoremap j gj
    nnoremap k gk
    nnoremap gJ J
    nnoremap J gJ
    vnoremap j gj
    vnoremap k gk
    vnoremap gJ J
    vnoremap J gJ

" Use visual lines for 0 and $ too
    nnoremap $ g$
    nnoremap 0 g0
    nnoremap g0 0
    nnoremap g$ $
    vnoremap $ g$
    vnoremap 0 g0
    vnoremap g0 0
    vnoremap g$ $

" Map :Q to :q (common typo)
    command! Q :q

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" CtrlP
    let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/](\.git|\.hg|\.svn|env)$',
     \ 'file': '\v\.pyc',
     \ 'link': '',
     \ }
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

    let g:airline_theme='tomorrow'

" vim-javascript
    let g:javascript_plugin_flow = 1

" Vim-JSX
    let g:jsx_ext_required = 0
