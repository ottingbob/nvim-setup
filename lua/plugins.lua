local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(user)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  -- VSCode-like pictograms
  use "onsails/lspkind-nvim"
  -- Snippet engine(s)
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-buffer'
  -- nvim-cmp source for built-in LSP
  use 'hrsh7th/cmp-nvim-lsp'
  -- Completion engine plugin
  use 'hrsh7th/nvim-cmp'

  -- UIs for various LSP related features such as hover doc, definition preview, and rename actions.
  use 'glepnir/lspsaga.nvim'

  -- Close tags
  use 'windwp/nvim-ts-autotag'
  -- Close brackets
  use 'windwp/nvim-autopairs'

  -- Syntax highlighting & theme
  use { 'ellisonleao/gruvbox.nvim' }

  use {'junegunn/fzf', run = ':call fzf#install()' }

  use 'stephpy/vim-yaml'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- TODO: Not sure if I need these. Could optionally remove some of the references in the after/plugin file...
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Better looking tabs
  use 'akinsho/nvim-bufferline.lua'

  -- Used for golang syntax highlighting / LSP support
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  -- Popular language parser for syntax highlightings
  use 'nvim-treesitter/nvim-treesitter'

  -- Movement / EasyMotion rewrite for nvim
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  --[[
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      -- optional, for file icons
      'nvim-tree/nvim-web-devicons',
    }
  }
  --]]
end)

