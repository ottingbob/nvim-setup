-- Load the related files
require('base')
require('plugins')

-- Allow NERDTree to show hidden files
vim.cmd("let NERDTreeShowHidden=1")

-- File config
vim.filetype.add({
  extension = {
    conf = 'dosini',
    avsc = 'json',
    schema = 'json',
    proto = 'proto',
    peg = 'go'
  }
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  command = "setlocal ts=2 sw=2 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  command = "setlocal ts=4 sw=4 sts=0 noexpandtab"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "setlocal ts=4 sw=4 sts=4"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  command = "setlocal ts=2 sw=2 sts=2"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "proto",
  command = "setlocal ts=2 sw=2 sts=2 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  command = "setlocal ts=2 sw=2 sts=2 expandtab"
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  -- buffer = buffer,
  callback = function()
    -- vim.lsp.buf.format { async = false }
    vim.cmd("silent! !python -m black %")
    vim.cmd("silent! !python -m isort %")
  end
})

-- Shortcut Commands
vim.keymap.set('n', '<leader>b', "<cmd>NERDTreeToggle<cr>", {noremap = true}) 
vim.keymap.set('n', '<leader>w', "<cmd>w %<cr>", {noremap = true}) 
vim.keymap.set('n', '<leader>,', ",", {noremap = true}) 
vim.keymap.set('n', '<leader>ev', "<cmd>split ~/.config/nvim/init.lua<cr>", {noremap = true}) 
vim.keymap.set('n', '<leader>vev', "<cmd>vsplit ~/.config/nvim/init.lua<cr>", {noremap = true}) 

-- Golang config
require 'lspconfig'.gopls.setup{}

-- Python config
local lsp = require('lspconfig')
-- local completion = require('cmp')

local custom_attach = function()
  -- completion.on_attach()
  -- Python isn't setting omnifunc correctly??
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lsp.pylsp.setup{ on_attach = custom_attach }
