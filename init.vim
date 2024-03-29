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
set mouse=a

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

"-------------- sensible path  and ignoring folders -----------------
set path+=lib/**,spec/**,test/**,src/**

" ignoring some folders
set wildignore+=node_modules,log,tmp
" set wildignore+=*/node_modules/*

" ------------- other complete options-------------------
" It is assumed wildmenu is on
" wildmode has to be full only to pum to work
set wildmode=full
" display the matches in popup menu
set wildoptions=pum
" popup menu transparency
set pumblend=17


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

"================ disable python support ==================
let g:loaded_python_provider=1
let g:loaded_python3_provider=1

"----------------- vim-plug ---------------
call plug#begin()
Plug 'JesseChavez/jellybeans.vim'
Plug 'JesseChavez/vim-puma'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
Plug 'benjifisher/matchit.zip'             "original author
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'vim-crystal/vim-crystal'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'codeindulgence/vim-tig'
" Plug 'cohama/lexima.vim'
Plug 'nathanaelkane/vim-indent-guides' " to toggle use ( <leader>ig )
" Plug 'brooth/far.vim'
Plug 'kassio/neoterm'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lspconfig'

Plug 'mustache/vim-mustache-handlebars'
Plug 'slim-template/vim-slim'

Plug 'HerringtonDarkholme/yats.vim'

Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
" Plug 'yuezk/vim-js'
" Plug 'mxw/vim-jsx'
" Plug 'chemzqm/vim-jsx-improve'
" Plug 'maxmellon/vim-jsx-pretty'

Plug 'posva/vim-vue'
Plug 'udalov/kotlin-vim'
" Plug 'ternjs/tern_for_vim' , { 'do': 'npm install' }
"Plug 'othree/javascript-libraries-syntax.vim'
" Plug '1995eaton/vim-better-javascript-completion'
Plug 'equalsraf/neovim-gui-shim' " related to ginit.vim

"Add plugins to &runtimepath
call plug#end()
"------------------------------------------

"Set color scheme
" silent! colorscheme onedark
" silent! colorscheme jellybeans
silent! colorscheme puma

set guifont=Noto\ Mono:h11

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
" set updatetime=1000              " 1 second
" let g:gitgutter_max_signs = 500  " default value

"-------------------- Signify (like Gitgutter) ----------------------
let g:signify_sign_change = '~'

"---------------------- FZF -----------------------------
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :GFiles<cr>

"----------------------- Ale settings -------------------------------
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

" highlight clear ALEErrorSign
" highlight clear ALEStyleWarning
let g:ale_set_highlights = 0

let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚠'
" let g:ale_sign_warning = '⚑'
let g:ale_sign_warning = '•'
" let g:ale_sign_warning = '！'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" disable lsp, coc will handle this
let g:ale_disable_lsp = 1

" without this all linters are enabled, this list enable specific linters
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'ruby': ['rubocop', 'ruby'],
" \   'eruby': [],
" \}
let g:ale_linters = {
\   'ruby': ['ruby'],
\}

"======================= Save map ===================================
" in some terminals  <c-s> it is used to stop the srolling
" and <c-q> to continue, so the key map below doesn't work in terminal
"nmap <c-s> :w<cr>
"imap <c-s> <esc>:w<cr>a
"nmap <Leader>s :w<cr>

"============================= Key Mappings ===================================
" to open Explorer
nnoremap <Leader>e :Ex<cr>

" to trigger omnifunc
inoremap <C-SPACE> <C-X><C-O>

" list buffers, it can be used 9 as well the code of <tab>
set wildcharm=<Tab>
" nnoremap <Leader>b :buffer<space><Tab>

"======================= airline settings =============================
" let g:airline_powerline_fonts = 2
let g:airline#extensions#tabline#enabled = 2

"==========================  c.o.c. ===================================
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"=========================== Disabling Arrow keys ====================
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

"========================= coc =====================================
let g:coc_global_extensions = ['coc-solargraph']

"======================== snippets ==========================
nnoremap <leader>html :-1read $HOME/dotfiles/templates/basic.html<cr>

"============================== spell checkiing =======================
autocmd BufRead,BufNewFile *.md,*.rb,*.yml,*.js,*.ts,*.tsx,*.py,*.vim,*.vue,*.txt,*.sh,COMMIT_EDITMSG setlocal spell
set complete+=kspell

"=============== omni =============
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"======== Enable slim syntax highlight ===========================
" autocmd FileType slim setlocal foldmethod=indent
" autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

autocmd FileType scss setl iskeyword+=@-@

autocmd FileType vue syntax sync fromstart
" autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx

" function to debug color groups
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" function to convert ruby hash syntax style
function! s:ChangeHashSyntax(line1,line2)
    let l:save_cursor = getpos(".")
    " silent! execute ':' . a:line1 . ',' . a:line2 . 's/\([^:]\):\([a-z0-9_]\+\)\s\+=>/\1\2:/g'
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/:\(\S\{-}\)\(\s\{-}\)=> /\1:\2/gc'
    call setpos('.', l:save_cursor)
endfunction

command! -range=% ChangeHashSyntax call <SID>ChangeHashSyntax(<line1>,<line2>)
