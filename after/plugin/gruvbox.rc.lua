local status, n = pcall(require, "gruvbox")
if (not status) then return end

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  strikethrough = true,
  italic = {
    -- If these are set to `true` they will highlight the background of the given tokens
    -- so I disable them since it seems a little jarring
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

