local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  -- TODO: Configure highlights / coloring based on your terminal setup...
})

-- FIXME: This conflicts with window navigation
-- vim.keymap.set('n', '<C-l>', '<Cmd>BufferLineCycleNext<CR>', {})
-- vim.keymap.set('n', '<C-h>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

