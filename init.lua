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

--- search and copy/cut/spell settings
opt.incsearch = true                          -- find the next match as we type the search
opt.hlsearch  = true                          -- highlight searches by default
opt.clipboard = opt.clipboard + 'unnamedplus' -- copy to system clipboard
opt.complete  = opt.complete + 'kspell'       -- spell check

--- plugins
require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'              -- Packer can manage itself
    use 'JesseChavez/vim-puma'                -- my own color scheme
    use 'jeetsukumaran/vim-filebeagle'        -- simple file navigation
    use 'tpope/vim-fugitive'                  -- git plugin
    use 'tpope/vim-surround'                  -- change surrounds
    use 'nvim-lualine/lualine.nvim'           -- alternative to airline
    use 'lewis6991/gitsigns.nvim'             -- git plugin similart to gittutter
    use {                                       
      'nvim-telescope/telescope.nvim',        -- Fuzzy Finder (files, lsp, etc)
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'mustache/vim-mustache-handlebars'    -- support for mustache and handlebars
    use 'slim-template/vim-slim'              -- support for slim templates
    -- use {
    --     'nvim-treesitter/nvim-treesitter',    -- better code highlight
    --     run = ':TSUpdate'
    -- }
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
cmd[[colorscheme puma]]

-- suppress filebeagle key mapping, by defaults binds <leader>f
cmd[[
  let g:filebeagle_suppress_keymaps = 1
  map <silent> - <Plug>FileBeagleOpenCurrentBufferDir
]]

-- ============================== spell checkiing =======================
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.rb", '*.yml', '*.js', '*.ts', '*.tsx', '*.lua', '*.vim', '*.sh', 'COMMIT_EDITMSG' }, command = "setlocal spell" }
)

-- lualine configuration
require('config_lualine')

-- telescope configuration
require('config_telescope')

-- gitsigns configuration
require('config_gitsigns')

-- treesitter configuration.
-- require('config_treesitter')

-- neovim lsp configuration
require('config_lsp')