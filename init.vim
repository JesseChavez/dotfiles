"===============================================================
"Neovim is set nocompatible by default
"===============================================================
set showcmd        "show partial command in status line
"set showmatch      "show matching brackets
set showmode       "show mode
set ruler          "show line and column numbers of cursor
set number         "show line number in left side
set colorcolumn=81 "vertical line

"----------- search and copy/cut settings -------------
set incsearch   "find the next match as we type the search
set hlsearch    "highlight searches by default
set clipboard+=unnamedplus "copy to system clipboard


set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.

" ------- initial tab and indent settings ------
set expandtab       " Insert spaces when TAB is pressed.
set shiftwidth=2    " Indentation amount for < and > commands.
set softtabstop=2   " Render TABs using this many spaces.
set autoindent      " initial sinple indent, just coppy the previous line indent

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Attempt to detect trailing white spaces.
match ErrorMsg '\s\+$'



"----------------- vim-plug ---------------
call plug#begin()
Plug 'nanotech/jellybeans.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'tpope/vim-rails', { 'for': 'ruby' }

Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', { 'for': 'ruby' }
"Plug 'benekastah/neomake'
Plug 'scrooloose/syntastic'
"Add plugins to &runtimepath
call plug#end()
"------------------------------------------

"Set color scheme
colorscheme jellybeans

"Use semicolon for commands
"nnoremap ; :

"--------- Map the leader key to SPACE ------------------
let mapleader="\<SPACE>"


"-------------------------- CtrlP settings --------------------------
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
"Key mappings for CtrlP
"Open file menu
nnoremap <Leader>o :CtrlP<CR>
"Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
"Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>


" airline settings
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
"let g:airline_theme= 'serene'


"--------------Save map -------------------
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

nmap <Leader>s :w<cr>


"Neomake on save
"autocmd! BufWritePost * Neomake

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

