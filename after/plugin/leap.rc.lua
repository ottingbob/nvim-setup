local status, leap = pcall(require, "leap")
if (not status) then return end

-- Explicitly override x so that this plugin DOES NOT
vim.keymap.set('n', 'x', 'x', {noremap = true})
vim.keymap.set('v', 'x', 'x', {noremap = true})
leap.add_default_mappings()
