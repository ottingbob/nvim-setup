-- TODO: Can probably have this in another file and set up some
--  different options other than just `lazy = true`
--
-- Init lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load the related files
require('base')
require("lazy").setup('lazyplugins', {
  lazy = true,  
})
-- Packer plugins
-- require('plugins')
require('lsp')
require('terminal')



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
