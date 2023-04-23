local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  -- Configure highlights / coloring based on terminal setup
  highlights = {
    background = {
      bg = '#32302f',
    },
    -- Unfortunately it seems like the `bg` here also applies to the background of
    -- the filetype icon that gets shown which makes it look off...
    buffer_selected = {
      -- Colors from:
      -- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua

      -- Bright Yellow
      -- bg = '#fabd2f',
      -- Light0 Soft
      bg = "#f2e5bc",

      -- Dark0 Soft
      -- fg = '#32302f',
      -- Dark1
      -- fg = "#3c3836",
      -- Dark2
      fg = "#504945",
    },
    separator = {
      bg = '#32302f',
      fg = "#f2e5bc",
    },
  },
  options = {
    mode = "tabs",
    -- separator_style = 'slant',
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
})

vim.keymap.set('n', '<C-a>l', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-a>h', '<Cmd>BufferLineCyclePrev<CR>', {})
-- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
