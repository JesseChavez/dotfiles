"No vi compatible
set nocompatible

"set smartindent
"set autoindent

" disabling the arrows key
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Allow backspacing (delete key) over everything in insert mode
set backspace=indent,eol,start

"Scroll with mouse iterm only vim
"this stops scroll along all iterm history
set mouse=a

"--------------------- gui settings --------------
set guifont=Roboto\ Mono\ Light\ for\ Powerline:h12
set guioptions-=r
set guioptions-=L

"====================BASIC SETTINGS===========================
"=============================================================
set laststatus=2    "Always display the status line
set number          "Show line number in left side
set colorcolumn=81  "Vertical line
set ruler           "Show line and column numbers of cursor
set showmode        "Show mode
set showcmd         "Show partial command in status line

"--------- search and copy/cut settings ------------
set incsearch       "Find the next match as we type the search
set hlsearch        "Highlight searches by default
"set clipboard+=unnamedplus "copy to system clipboard


"--------- initial tab and indent settings ------------
set expandtab           " replaces tab with spaces
set shiftwidth=4
set softtabstop=4
set autoindent

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Attempt to detect trailing white spaces.
" Display extra whitespace
set list listchars=tab:»‡,trail:‡,nbsp:‡
" set list listchars=tab:»•,trail:•,nbsp:•
match ErrorMsg '\s\+$'


" no swap
set noswapfile


" plugin manager
execute pathogen#infect()


"Set color scheme
colorscheme jellybeans

"-------- Map the leader key to SPACE ---------------------
let mapleader="\<SPACE>"

"---------------------- Gitgutter -------------------------
set updatetime=1000              " 1 second
let g:gitgutter_max_signs = 500  " default value

"------------------------- Ctrlp settings ---------------------------
"let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:40'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:40'
"Key mappings for CtrlP
"Open file menu
nnoremap <Leader>o :CtrlP<CR>
"Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
"Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

"------------- Save map --------------
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

"--------------------- Syntastic settings ------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

"--------------  vim-airline  --------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
