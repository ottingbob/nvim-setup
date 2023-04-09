-- Load the related files
require('base')
require('plugins')
require('lsp')

-- Shortcut Commands
vim.keymap.set('n', '<leader>b', "<cmd>NvimTreeToggle<cr>", {noremap = true})
vim.keymap.set('n', '<leader>w', "<cmd>w %<cr>", {noremap = true}) 
vim.keymap.set('n', '<leader>,', ",", {noremap = true}) 
vim.keymap.set('n', '<leader>ev', "<cmd>split ~/.config/nvim/init.lua<cr>", {noremap = true}) 
vim.keymap.set('n', '<leader>vev', "<cmd>vsplit ~/.config/nvim/init.lua<cr>", {noremap = true}) 
-- Dunno why I need to call this twice but thats what works for me...
vim.keymap.set('i', '<leader>w', "<cmd>lua vim.lsp.buf.hover()<cr><cmd>lua vim.lsp.buf.hover()<cr>")

-- Diagnostic in quickfix
vim.diagnostic.config({
  virtual_text = false
})
vim.o.updatetime = 250
vim.cmd("autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})")
