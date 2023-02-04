local status, go = pcall(require, "go")
if (not status) then return end

-- Startup / Setup the GO Plugin
go.setup({
  -- Default go command
  go = "go",
  goimport = "gopls",
  gofmt = "gofumpt",
  max_line_len = 120,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

