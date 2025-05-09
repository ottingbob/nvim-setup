local lsp = require('lspconfig')

-- nvim-lspconfig docs
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "Tiltfile", "tiltfile" },
  callback = function()
    vim.bo.filetype = "tiltfile"
  end,
})

--[[
-- Deno config
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
-- -- NOTE: This should work with the `ts_ls` entry now. Previously, in order for
-- --   this to have an affect, I had to disable the `ts_ls` entry below so this
-- --   would always run.
lsp.denols.setup{
  -- https://github.com/hasundue/nvim/blob/main/lua/lang/deno.lua
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
  settings = {
    deno = {
      enable = true,
    },
    typescript = {
      inlayHints = {
        enabled = "on",
        functionLikeReturnTypes = { enabled = true },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
    },
  },
  single_file_support = true,
}
]]--

-- Postgres config
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#postgres_lsp
lsp.postgres_lsp.setup{}

-- Tilt config
lsp.tilt_ls.setup{}

-- Golang config
lsp.gopls.setup{}

-- Python config
lsp.pylsp.setup{
  -- NOTE: In your project ensure to have the dev dep: `python-lsp-ruff`
  -- https://github.com/python-lsp/python-lsp-ruff

  -- Include ruff config in here...
  plugins = {
    ruff = {
      enabled = true,
      formatEnabled = true,
      -- Ensure these rules are used
      extendSelect = { "F", "E", "W", "I001", "E501" },

      -- Below rules are ignored when pyproject.toml / ruff.toml is present
      lineLength = 100,
      exclude = { "__about__.py" },
    },
  }
}

-- Typescript config
lsp.ts_ls.setup{
  root_dir = lsp.util.root_pattern("package.json"),
  single_file_support = false,
}

-- Rust config
lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    }
  }
})

-- https://github.com/neovim/nvim-lspconfig#Suggested-configuration
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    -- FIXME: This conflicts with window navigation
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- File config
vim.filetype.add({
  extension = {
    conf = 'dosini',
    avsc = 'json',
    schema = 'json',
    proto = 'proto',
    peg = 'go'
  }
})

-- Filetype extensions and tabbing
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  command = "setlocal ts=2 sw=2 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  command = "setlocal ts=2 sw=2 sts=0 noexpandtab"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "setlocal ts=4 sw=4 sts=4"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  command = "setlocal ts=2 sw=2 sts=2"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "proto",
  command = "setlocal ts=2 sw=2 sts=2 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  command = "setlocal ts=2 sw=2 sts=2 expandtab"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  command = "setlocal ts=2 sw=2 sts=2 expandtab"
})

-- Filetype macros to run on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.scala",
  callback = function()
    -- TODO: Should check if metals is installed...
    vim.cmd("silent! MetalsRunScalafix")
    vim.lsp.buf.format({ async = true })
  end
})

-- Helper method to check if tool exists
local function tool_exists(tool)
  local handle = io.popen("command -v " .. tool)
  local result = handle:read("*a")
  handle:close()
  -- returns true if command is found
  return result ~= ""
end

-- Check to see if ruff exists
local ruff_exists = tool_exists("ruff")
-- Check to see if black exists
local black_exists = tool_exists("black")
-- Check to see if isort exists
local isort_exists = tool_exists("isort")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()

    -- TODO: Might want to see if ruff fails and still use isort/black if so
    -- Use ruff if available otherwise use isort & black
    if ruff_exists then
      -- Ruff does not support sorting imports
      -- https://docs.astral.sh/ruff/formatter/#sorting-imports
      --
      -- NOTE: Ruff should do this stuff by default already...
      --   Instead we should just use the configs set above in the `pylsp` block
      vim.cmd("silent! !python -m ruff check --fix %")
      vim.cmd("silent! !python -m ruff format %")
    elseif black_exists and isort_exists then
      vim.cmd("silent! !python -m isort %")
      vim.cmd("silent! !python -m black %")
    end

  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.rs",
  callback = function()
    vim.cmd("silent! !cargo fmt")
  end
})
