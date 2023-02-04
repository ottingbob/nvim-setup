local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

-- local fb_actions = require "telescope".extensions.file_browser.actions

-- Configure telescope to setup the fuzzy finder  
telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".terraform", "%.jpg", "%.png" },
    path_display = { 'truncate' },
    vimgrep_arguments = {
      "rg",
      "--follow",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--no-ignore",
      "--trim",
    },
    n = {
      ["q"] = actions.close
    },
  },
  --[[
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function() vim.cmd('startinsert') end,
        },
      },
    },
  }, --]]
})

-- telescope.load_extension("file_browser")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {noremap = true})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})


