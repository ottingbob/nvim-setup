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

  -- LSP status
  use 'j-hui/fidget.nvim'

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

  -- Fuzzy finder
  use {'junegunn/fzf', run = ':call fzf#install()' }

  use 'stephpy/vim-yaml'

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Telescope helps find files with the use of rg
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- TODO: Double check if this is needed to search the file tree
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Better looking tabs
  use 'akinsho/nvim-bufferline.lua'

  -- Git decorations
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'v0.6',
  }

  -- Used for golang syntax highlighting / LSP support
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  -- Scala LSP support
  use {
    'scalameta/nvim-metals',
    requires = { "nvim-lua/plenary.nvim" }
  }

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

  -- Markdown Viewer
  use {
    "iamcco/markdown-preview.nvim",
    -- Installs without using yarn / npm
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  -- Leap - motion throughout files
  use 'ggandor/leap.nvim'

  -- Surround -- improved selection surround commands
  use {
    "kylechui/nvim-surround",
    tag = "v1.0.0",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  }

end)

