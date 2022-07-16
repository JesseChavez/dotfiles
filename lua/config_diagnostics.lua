-- neovim diagnostics configuration

-- Mappings:
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- overrides default diagnostic defaults
-- (text to right is removed since is too much noise)
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local signs = { Error = '✗', Warn = '⚠', Hint = '‣', Info = '•' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- hover for diagnostic:
vim.opt.updatetime = 250 -- global refresh time

-- opens diagnostic float window when cursor reach line
-- (render on top of default float window when goto_prev or goto_next is used)
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(bor, {focus=false, border='rounded'})]]

-- this does not seems to work
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "double",
})
