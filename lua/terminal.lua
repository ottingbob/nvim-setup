-- Commands and configs related to terminal splits

-- TODO: Fix floating window extesion and put it in here
-- local float = require('float_window')

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

-- Allow tab navigation to override terminal
vim.keymap.set('t', '<C-a>h', '<cmd>tabprev<cr>')
vim.keymap.set('t', '<C-a>l', '<cmd>tabnext<cr>')

-- Exit out of a term quickly instead of the claw-cruncher <c-\><c-n>
vim.keymap.set('t', '<leader>x', '<C-\\><C-n>')

-- When navigating to a terminal automatically enter it...
vim.api.nvim_create_autocmd({"BufWinEnter", "WinEnter"}, {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end
})

-- Split into a terminal
vim.keymap.set('n', '<leader>t', '<cmd>set splitbelow | sp | resize 15 | startinsert | term<cr>')
vim.keymap.set('n', '<leader>vt', '<cmd>vs | startinsert | term<cr>')
-- Tab new terminal
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew | startinsert | term<cr>')
