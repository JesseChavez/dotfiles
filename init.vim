"===============================================================
"Neovim is set nocompatible by default
"===============================================================


"===================== Basic Settings ==========================
set laststatus=1   "Always display the status line
set number         "show line number in left side
set colorcolumn=81 "vertical line
set ruler          "show line and column numbers of cursor
set showcmd        "show partial command in status line
set showmode       "show mode
"set showmatch      "show matching brackets

"----------- search and copy/cut settings -------------
set incsearch   "find the next match as we type the search
set hlsearch    "highlight searches by default
"set clipboard+=unnamedplus "copy to system clipboard


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

" Display extra whitespace
set list listchars=tab:»‡,trail:‡,nbsp:‡
" set list listchars=tab:»•,trail:•,nbsp:•
match ErrorMsg '\s\+$'

" no swap file
set noswapfile


"===================== GUI settings =========================
set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline:h13


"----------------- vim-plug ---------------
call plug#begin()
Plug 'nanotech/jellybeans.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'ervandew/supertab'
Plug 'benjifisher/matchit.zip'             "original author
"Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'benekastah/neomake'
"Plug 'scrooloose/syntastic'
Plug 'cohama/lexima.vim'

"Add plugins to &runtimepath
call plug#end()
"------------------------------------------

"Set color scheme
silent! colorscheme jellybeans

"--------- Map the leader key to SPACE ------------------
let mapleader="\<SPACE>"

"---------------------- Gitgutter -------------------------
set updatetime=1000              " 1 second
let g:gitgutter_max_signs = 500  " default value

"-------------------------- CtrlP settings --------------------------
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:40'
"Key mappings for CtrlP
"Open file menu
nnoremap <Leader>o :CtrlP<CR>
"Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
"Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>


"======================= Save map ===================================
" in some terminals  <c-s> it is used to stop the srolling
" and <c-q> to continue, so the key map below doesn't work in terminal
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a
"nmap <Leader>s :w<cr>

"======================== Neomake settings ==========================
" Auto runs Neomake
" autocmd! BufWritePost,BufEnter * Neomake "on save and buffer activation
autocmd! BufWritePost * Neomake "on save and buffer activation
"let g:neomake_open_list = 2     " open list or errors
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']

"======================== Syntastic settings =========================
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" let g:syntastic_eruby_ruby_quiet_messages =
"      \ {'regex': 'possibly useless use of a variable in void context'}



"======================= airline settings =============================
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 2

if has('nvim')
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = '|'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = '|'
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = '|'
"let g:airline_theme= 'serene'
endif


"=========================== Disabling Arrow keys ====================
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

"============================== spell checkiing =======================
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell




"Neomake on save
"autocmd! BufWritePost * Neomake
