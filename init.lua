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

-- Switch between windows quickly
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {noremap = true})
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {noremap = true})

-- Switch between terminal windows quickly
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>')

-- Split into a terminal
vim.keymap.set('n', '<leader>t', '<cmd>set splitbelow | sp | resize 15 | term<cr>')
vim.keymap.set('n', '<leader>vt', '<cmd>vs | resize 15 | term<cr>')

-- Diagnostic in quickfix
vim.diagnostic.config({
  virtual_text = false
})
vim.o.updatetime = 250
vim.cmd("autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})")
