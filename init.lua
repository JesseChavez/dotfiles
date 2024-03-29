-- ===================== Neovim init config =====================
local cmd = vim.cmd      --vim commands
local fn  = vim.fn       --vim functions
local g   = vim.g        --vim global variables
local opt = vim.opt      --vim options

-- ===================== Basic Settings ==========================

--- basic settings
opt.laststatus    = 2                 -- Always display the status line
opt.number        = true              -- show line number in left side
opt.colorcolumn   = '81'              -- vertical line
opt.ruler         = true              -- show line and column numbers of cursor
opt.showcmd       = true              -- show partial command in status line
opt.showmode      = true              -- show mode
opt.mouse         = 'nv'              -- enable mouse in normal and visual mode
-- opt.showmatch = true               -- show matching brackets
-- opt.encoding  = "utf-8"
opt.termguicolors = true              -- truecolor support
opt.splitbelow    = true              -- put new windows below current
opt.splitright    = true              -- put new vertical splits to right

--- initial tab and indent settings ------
opt.expandtab   = true      -- Insert spaces when TAB is pressed.
opt.shiftwidth  = 2         -- Indentation amount for < and > commands.
opt.softtabstop = 2         -- Render TAB using this many spaces.
opt.autoindent  = true      -- initial simple indent, just copy the previous line indent

opt.list      = true
opt.listchars = { tab = '▸ ', trail = '‡' }
-- opt.listchars = { eol = '↲', tab = '·»', trail = '‡' }

--- search, copy, paste, spell, ignore settings
opt.incsearch  = true                          -- find the next match as we type the search
opt.hlsearch   = true                          -- highlight searches by default
opt.clipboard  = opt.clipboard + 'unnamedplus' -- copy to system clipboard
opt.complete   = opt.complete + 'kspell'       -- spell check
opt.wildignore = opt.wildignore + 'node_modules,log,tmp'

--- setting font
if vim.g.goneovim then
  -- no sure why opt.guifont does not work for goneovim and nvui
  -- cmd[[set guifont=Noto\ Mono:h12]]
  cmd[[set guifont=DejaVu\ San\ Mono:h12]]
elseif vim.g.nvui then
  cmd[[set guifont=Noto\ Mono:h12]]
elseif vim.g.nvimQt then
  -- nvim-qt does not define a global var for this, only defines GuiFont, etc.
  -- but it does not work here. It uses ginit.vim to load font & other settings.
  -- It also has nvim-qt.conf configurable directly, setting font in command
  -- mode will update nvim-qt.conf e.g. "set guifont=DejaVu\ San\ Mono:h12"
else
  -- It seems for nvim in terminal, the font is managed by the terminal app
  -- this is set but ignored
  opt.guifont = { 'Noto Mono', 'h14' }
end

--- plugins
require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'              -- Packer can manage itself
    use 'JesseChavez/vim-puma'                -- my own color scheme
    use 'joshdick/onedark.vim'                -- alternative color scheme
    use 'folke/tokyonight.nvim'               -- another alternative color scheme
    use 'jeetsukumaran/vim-filebeagle'        -- simple file navigation
    use 'tpope/vim-fugitive'                  -- git plugin
    use 'tpope/vim-surround'                  -- change surrounds
    use 'tpope/vim-endwise'                   -- endwise closing language word
    use 'Raimondi/delimitMate'                -- endwise for brackets, quotes, etc
    use 'vim-ruby/vim-ruby'
    use { 'tpope/vim-rails', ft = 'ruby' }    -- rails additions
    use 'HerringtonDarkholme/yats.vim'        -- typescript syntax and indentation
    use 'maxmellon/vim-jsx-pretty'            -- fixes tsx indentation issue in yats
    -- lua based plugins
    use 'nvim-lualine/lualine.nvim'           -- alternative to airline
    use 'lewis6991/gitsigns.nvim'             -- git plugin similar to gittutter
    use {
      'nvim-telescope/telescope.nvim',        -- Fuzzy Finder (files, lsp, etc)
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'mustache/vim-mustache-handlebars'    -- support for mustache and handlebars
    use 'slim-template/vim-slim'              -- support for slim templates
    use {
        'nvim-treesitter/nvim-treesitter',    -- better code highlight
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'         -- treesitter tree and debug highlighting
    use 'neovim/nvim-lspconfig'               -- configuration for neovim built-in lsp
    use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'         -- Snippets plugin
  end
)

-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- setting color color scheme
vim.g.tokyonight_style = 'night'
cmd[[colorscheme puma]]

-- suppress filebeagle key mapping, by defaults binds <leader>f
cmd[[
  let g:filebeagle_suppress_keymaps = 1
  map <silent> - <Plug>FileBeagleOpenCurrentBufferDir
]]

-- function to debug and customise color schemes for old vim regex syntax engine
-- run in command mode :call SynStack()
cmd [[
  function! SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunction
]]

-- ============================== spell checkiing =======================
vim.keymap.set('n', 'rr', ":!go run main.go<cr>", {noremap = true})

-- ============================== spell checkiing =======================
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.rb", '*.yml', '*.js', '*.ts', '*.tsx', '*.lua', '*.vim', '*.sh', 'COMMIT_EDITMSG' },
  command = "setlocal spell"
})

-- no sure why FileType does not work
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.go" }, command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab"
})
-- lualine configuration
require('config_lualine')

-- telescope configuration
require('config_telescope')

-- gitsigns configuration
require('config_gitsigns')

-- treesitter configuration.
require('config_treesitter')

-- neovim diagnostics configuration
require('config_diagnostics')

-- neovim lsp configuration
require('config_lsp')
