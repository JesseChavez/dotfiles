"===============================================================
"Neovim is set nocompatible by default
"===============================================================


"===================== Basic Settings ==========================
set laststatus=2   "Always display the status line
set number         "show line number in left side
set colorcolumn=81 "vertical line
set ruler          "show line and column numbers of cursor
set showcmd        "show partial command in status line
set showmode       "show mode
"set showmatch      "show matching brackets
set termguicolors

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

" ------------- complete options in insert mode-------------------
set completeopt=longest,menuone,preview " show the matches even if one

" ------------- other complete  options-------------------
set wildmode=list:full
" ignoring some folders, command-t uses this to ignore files
set wildignore+=node_modules,log,tmp


" ------------- syntax and editing file options -------------------
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Display extra whitespace
set list listchars=tab:»‡,trail:‡,nbsp:‡
" set list listchars=tab:»•,trail:•,nbsp:•
match ErrorMsg '\s\+$'

" ------------- some file saving options -------------------
set noswapfile
" Important for webpack, parcel, or any other programs that are watching files.
" It is strategy for saving files.
set backupcopy=yes

"================ disable python 2 support ==================
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1

"----------------- vim-plug ---------------
call plug#begin()
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'benjifisher/matchit.zip'             "original author
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
" Plug 'cohama/lexima.vim'
Plug 'nathanaelkane/vim-indent-guides' " to toggle use ( <leader>ig )
" Plug 'brooth/far.vim'
Plug 'kassio/neoterm'
Plug 'jeetsukumaran/vim-filebeagle'
if has('mac')
  Plug '/usr/local/opt/fzf'
else
  " Plug $HOME.'/.linuxbrew/opt/fzf'
  Plug '/home/linuxbrew/.linuxbrew/opt/fzf'
endif
Plug 'junegunn/fzf.vim'

Plug 'mustache/vim-mustache-handlebars'
Plug 'slim-template/vim-slim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
" Plug 'ternjs/tern_for_vim' , { 'do': 'npm install' }
"Plug 'othree/javascript-libraries-syntax.vim'
" Plug '1995eaton/vim-better-javascript-completion'
Plug 'equalsraf/neovim-gui-shim' " related to ginit.vim

"Add plugins to &runtimepath
call plug#end()
"------------------------------------------

"Set color scheme
silent! colorscheme jellybeans

"------------------ splits settings ---------------------------------
set splitbelow  " open new split below
set splitright  " open vertical split on the right

"--------------------- neovim terminal ------------------------------
tnoremap <Esc> <C-\><C-n>
"nnoremap <Leader>t :split | term
let g:neoterm_repl_ruby = 'pry'
" command! -nargs=* T split | terminal <args>
" command! -nargs=* VT vsplit | terminal <args>

"--------- Map the leader key to SPACE ------------------
let mapleader="\<SPACE>"

"---------------------- Filebeagle ---------------------------
" disable the default mapping keys so I can map my own ones
let g:filebeagle_suppress_keymaps = 1
" map <silent> <Leader>f  <Plug>FileBeagleOpenCurrentWorkingDir
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir

"---------------------- Gitgutter -------------------------
set updatetime=1000              " 1 second
let g:gitgutter_max_signs = 500  " default value

"----------------------- Ale settings -------------------------------
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

" highlight clear ALEErrorSign
" highlight clear ALEStyleWarning
let g:ale_set_highlights = 0

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" without this all linters are enabled, this list enable specific linters
let g:ale_linters = {
\   'javascript': ['standard'],
\   'ruby': ['rubocop', 'ruby'],
\   'eruby': [],
\}

"---------------------- FZF -----------------------------
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :GFiles<cr>

"======================= Save map ===================================
" in some terminals  <c-s> it is used to stop the srolling
" and <c-q> to continue, so the key map below doesn't work in terminal
"nmap <c-s> :w<cr>
"imap <c-s> <esc>:w<cr>a
"nmap <Leader>s :w<cr>

"======================= Explore ==================
nnoremap <Leader>e :Ex<cr>

"======================= airline settings =============================
" let g:airline_powerline_fonts = 2
let g:airline#extensions#tabline#enabled = 2

"========================== supertab settings =======================
let g:SuperTabDefaultCompletionType = '<c-n>'
"let g:SuperTabContextDefaultCompletionType = '<c-n>'

"=========================== Disabling Arrow keys ====================
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

"======================== snippets ==========================
nnoremap <leader>html :-1read $HOME/dotfiles/templates/basic.html<cr>

"============================== spell checkiing =======================
autocmd BufRead,BufNewFile *.md,*.rb,*.yml,*.js,*.py,*.vim,*.vue,*.txt,*.sh,COMMIT_EDITMSG setlocal spell
set complete+=kspell

"=============== omni =============
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"======== Enable slim syntax highlight ===========================
" autocmd FileType slim setlocal foldmethod=indent
" autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

autocmd FileType vue syntax sync fromstart
