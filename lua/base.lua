-- Map ',' as leader
vim.g.mapleader = ','

-- Smaller updatetime for CursorHold and CursorHoldI
vim.opt.updatetime = 300

-- Better display for messages
vim.opt.cmdheight = 2

-- General configs
vim.opthistory = 100
vim.opt.showbreak = '↪\\ \\'
vim.opt.linebreak = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.clipboard:append('unnamedplus')
vim.opt.backspace = { 'start', 'eol', 'indent' }
-- When finding files search down into subfolders
vim.opt.path:append { '**' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.spell = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Helps with the omnicomplete menu and not auto selecting values
table.insert(vim.opt.completeopt, 'noinsert')

-- Disable the mouse
vim.opt.mouse= ""
vim.opt.ruler = true

-- No backup/swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.autoread = true

-- Better search under cursor
vim.keymap.set('n', '*', '*``', { noremap = true })

-- Theme
vim.opt.termguicolors = true

