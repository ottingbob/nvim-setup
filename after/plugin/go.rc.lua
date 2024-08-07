local status, go = pcall(require, "go")
if (not status) then return end

-- Startup / Setup the GO Plugin
go.setup({
  -- Default go command
  go = "go",
  goimports = "gopls",
  gofmt = "gofumpt",
  -- go.nvim max_line_len only effective when gofmt is golines
  -- max_line_len = 120,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

