return {
  'neovim/nvim-lspconfig',

  -- LSP status
  'j-hui/fidget.nvim',

  -- VSCode-like pictograms
  "onsails/lspkind-nvim",
  -- Snippet engine(s)
  -- 'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  -- nvim-cmp source for buffer words
  'hrsh7th/cmp-buffer',
  -- nvim-cmp source for built-in LSP
  'hrsh7th/cmp-nvim-lsp',
  -- Completion engine plugin
  'hrsh7th/nvim-cmp',

  -- UIs for various LSP related features such as hover doc, definition preview, and rename actions.
  'glepnir/lspsaga.nvim',

  -- Close tags
  'windwp/nvim-ts-autotag',
  -- Close brackets
  'windwp/nvim-autopairs',

  -- Syntax highlighting & theme
  { 'ellisonleao/gruvbox.nvim' },

  -- Fuzzy finder
  { 'junegunn/fzf', build = ':call fzf#install()' },

  -- Yaml Plugin ??
  'stephpy/vim-yaml',

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    version = 'nightly', -- optional, updated every week. (see issue #1193)
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    opts = function()
      -- return require "after.plugins.nvim-tree"
      return {}
    end,
    config = function(_, opts)
      -- dofile(vim.g.base46_cache .. "nvimtree")
      -- require("nvim-tree").setup(opts)
    end,
  },

  -- Telescope helps find files with the use of rg
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- TODO: Double check if this is needed to search the file tree
  'nvim-telescope/telescope-file-browser.nvim',

  -- Find and Replace
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Better looking tabs
  'akinsho/nvim-bufferline.lua',

  -- Git decorations
  {
    'lewis6991/gitsigns.nvim',
    tag = 'v0.6',
  },

  -- Used for golang syntax highlighting / LSP support
  'ray-x/go.nvim',
  'ray-x/guihua.lua',

  -- Rust LSP support
  'simrat39/rust-tools.nvim',

  -- Scala LSP support
  {
    'scalameta/nvim-metals',
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Popular language parser for syntax highlightings
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ":TSUpdate",
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
          ensure_installed = {
            "tsx",
            "toml",
            "json",
            "yaml",
            "css",
            "html",
            "lua",
            "markdown",
            "markdown_inline",
            "go",
            "dockerfile",
            "bash",
            "c",
            "vim",
            "vimdoc",
            "query",
            "javascript",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
          auto_install = true,
        })
    end,
  },

  -- Movement / EasyMotion rewrite for nvim
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  -- Markdown Viewer
  {
    "iamcco/markdown-preview.nvim",
    -- Installs without using yarn / npm
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Leap - motion throughout files
  'ggandor/leap.nvim',

  -- Surround -- improved selection surround commands
  {
    "kylechui/nvim-surround",
    tag = "v1.0.0",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  -- Github PR / Issues
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("octo").setup()
    end,
  }
}
