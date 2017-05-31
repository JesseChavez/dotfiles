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

" ------------- complete options -------------------
set completeopt=longest,menuone,preview " show the matches even if one

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

"================ disable python 2 support ==================
let g:loaded_python_provider = 1

"----------------- vim-plug ---------------
call plug#begin()
Plug 'nanotech/jellybeans.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'benjifisher/matchit.zip'             "original author
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
"Plug 'scrooloose/syntastic'
" Plug 'cohama/lexima.vim'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nathanaelkane/vim-indent-guides' " to toggle use ( <leader>ig )
Plug 'brooth/far.vim'
Plug 'jeetsukumaran/vim-buffergator'

Plug 'mustache/vim-mustache-handlebars'
Plug 'slim-template/vim-slim'
Plug 'pangloss/vim-javascript'
" Plug 'ternjs/tern_for_vim' , { 'do': 'npm install' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug '1995eaton/vim-better-javascript-completion'
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
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

"--------- Map the leader key to SPACE ------------------
let mapleader="\<SPACE>"

"--------------------- Buffer naviagation ---------------------------
" nnoremap <Leader>b :ls<cr>:b
" nnoremap <Leader>b q:ib<space>
let g:buffergator_viewport_split_policy='B'

"---------------------- Gitgutter -------------------------
set updatetime=1000              " 1 second
let g:gitgutter_max_signs = 500  " default value

"======================= Save map ===================================
" in some terminals  <c-s> it is used to stop the srolling
" and <c-q> to continue, so the key map below doesn't work in terminal
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a
"nmap <Leader>s :w<cr>

"======================== Neomake settings ==========================
" Auto runs Neomake
"let g:neomake_open_list = 2     " open list or errors
"let g:neomage_ruby_mri_exe = '~/.rvm/rubies/ruby-2.2.4/bin/ruby'
"let g:neomage_ruby_rubocop_exe = '~/.rvm/gems/ruby-2.2.2/bin/rubocop'
" let g:neomake_c_lint_maker = {
"   \ 'exe': 'lint',
" }
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']

let g:neomake_javascript_enabled_makers = ['eslint']

" autocmd! BufWritePost,BufEnter * Neomake "on save and buffer activation
autocmd! BufWritePost * Neomake "on save and buffer activation

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2

" if !has('gui_running')
"   let g:airline#extensions#tabline#fnamemod = ':t'
"   let g:airline#extensions#tabline#left_sep = ''
"   let g:airline#extensions#tabline#left_alt_sep = '|'
"   let g:airline#extensions#tabline#right_sep = ''
"   let g:airline#extensions#tabline#right_alt_sep = '|'
"   let g:airline_left_sep = ''
"   let g:airline_left_alt_sep = '|'
"   let g:airline_right_sep = ''
"   let g:airline_right_alt_sep = '|'
" "let g:airline_theme= 'serene'
" endif

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

"============================== spell checkiing =======================
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

"=============== deoplete =========
"let g:deoplete#enable_at_startup = 1

"Neomake on save
"autocmd! BufWritePost * Neomake

"=============== omni =============
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"======== Enable slim syntax highlight ===========================
" autocmd FileType slim setlocal foldmethod=indent
" autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
