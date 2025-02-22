-- TODO: Move this somewhere else...
-- https://github.com/yetone/avante.nvim/issues/1149

-- Ollama API Documentation https://github.com/ollama/ollama/blob/main/docs/api.md#generate-a-completion
-- local role_map = {
-- 	user = "user",
-- 	assistant = "assistant",
-- 	system = "system",
-- 	tool = "tool",
-- }
-- 
-- ---@param opts AvantePromptOptions
-- local parse_messages = function(self, opts)
-- 	local messages = {}
-- 	local has_images = opts.image_paths and #opts.image_paths > 0
-- 	-- Ensure opts.messages is always a table
-- 	local msg_list = opts.messages or {}
-- 	-- Convert Avante messages to Ollama format
-- 	for _, msg in ipairs(msg_list) do
-- 		local role = role_map[msg.role] or "assistant"
-- 		local content = msg.content or "" -- Default content to empty string
-- 		-- Handle multimodal content if images are present
-- 		-- *Experimental* not tested
-- 		if has_images and role == "user" then
-- 			local message_content = {
-- 				role = role,
-- 				content = content,
-- 				images = {},
-- 			}
-- 			for _, image_path in ipairs(opts.image_paths) do
-- 				local base64_content = vim.fn.system(string.format("base64 -w 0 %s", image_path)):gsub("\n", "")
-- 				table.insert(message_content.images, "data:image/png;base64," .. base64_content)
-- 			end
-- 			table.insert(messages, message_content)
-- 		else
-- 			table.insert(messages, {
-- 				role = role,
-- 				content = content,
-- 			})
-- 		end
-- 	end
-- 	return messages
-- end
-- 
-- local function parse_curl_args(self, code_opts)
-- 	-- Create the messages array starting with the system message
-- 	local messages = {
-- 		{ role = "system", content = code_opts.system_prompt },
-- 	}
-- 	-- Extend messages with the parsed conversation messages
-- 	vim.list_extend(messages, self:parse_messages(code_opts))
-- 	-- Construct options separately for clarity
-- 	local options = {
-- 		num_ctx = (self.options and self.options.num_ctx) or 4096,
-- 		temperature = code_opts.temperature or (self.options and self.options.temperature) or 0,
-- 	}
-- 	-- Check if tools table is empty
-- 	local tools = (code_opts.tools and next(code_opts.tools)) and code_opts.tools or nil
-- 	-- Return the final request table
-- 	return {
-- 		url = self.endpoint .. "/api/chat",
-- 		headers = {
-- 			Accept = "application/json",
-- 			["Content-Type"] = "application/json",
-- 		},
-- 		body = {
-- 			model = self.model,
-- 			messages = messages,
-- 			options = options,
-- 			-- tools = tools, -- Optional tool support
-- 			stream = true, -- Keep streaming enabled
-- 		},
-- 	}
-- end
-- 
-- local function parse_stream_data(data, handler_opts)
--   print(data)
-- 	local json_data = vim.fn.json_decode(data)
-- 	if json_data then
-- 		if json_data.done then
-- 			handler_opts.on_stop({ reason = json_data.done_reason or "stop" })
-- 			return
-- 		end
-- 		if json_data.message then
-- 			local content = json_data.message.content
-- 			if content and content ~= "" then
-- 				handler_opts.on_chunk(content)
-- 			end
-- 		end
-- 		-- Handle tool calls if present
-- 		if json_data.tool_calls then
-- 			for _, tool in ipairs(json_data.tool_calls) do
-- 				handler_opts.on_tool(tool)
-- 			end
-- 		end
-- 	end
-- end
-- 
-- ---@type AvanteProvider
-- local ollama = {
-- 	api_key_name = "",
--   endpoint = "http://ollama.ollama.svc.cluster.local:11434/v1",
--   -- NOTE: This model does not support snippet generation
--   -- model = "codellama:13b",
--   -- model = "codegemma:7b",
--   model = "opencoder:8b",
-- 	parse_messages = parse_messages,
-- 	parse_curl_args = parse_curl_args,
-- 	parse_stream_data = parse_stream_data,
-- }

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
    -- version = 'nightly', -- optional, updated every week. (see issue #1193)
    version = "v1.1.1",
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
            "starlark",
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
  },

  -- HTTP Client
  {
    'mistweaverco/kulala.nvim',
    opts = {},
  },

  -- AI Coding
  -- 
  -- Going to leave a few here that seem interesting:
  -- https://www.reddit.com/r/neovim/comments/1fc8k93/looking_for_good_suggestions_for_ai_plugins/
  --
  -- https://github.com/yetone/avante.nvim
  -- * very popular, makes a cursor ai like IDE
  --
  -- https://github.com/olimorris/codecompanion.nvim
  -- * less popular but similar alternative
  -- https://github.com/oca159/lazyvim/blob/main/lua/plugins/codecompanion.lua
  --
  -- https://github.com/David-Kunz/gen.nvim
  -- https://github.com/bernardo-bruning/ollama-copilot
  -- https://github.com/Robitx/gp.nvim
  -- https://github.com/oflisback/describe-command.nvim

  -- Docs:
  -- https://codecompanion.olimorris.dev/configuration/action-palette.html
  -- This example below was ripped from the reddit post above
  {
    "olimorris/codecompanion.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "ollama",
            keymaps = {
              send = {
                modes = {
                  n = { "<CR>" },
                  i = nil,
                },
              },
              close = {
                modes = {
                  n = "q",
                  i = "<c-x>",
                },
              },
              stop = {
                modes = {
                  n = "<c-x>",
                },
              }
            }
          },
          inline = {
            adapter = "ollama",
          },
          agent = {
            adapter = "ollama",
          },
        },
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = "http://ollama.ollama.svc.cluster.local:11434",
              },
              schema = {
                model = {
                  -- default = "deepseek-coder-v2",
                  -- default = "codegemma:7b",
                  default = "codellama:13b",
                },
              },
            })
          end,
        },
      })
      vim.api.nvim_set_keymap("n", "<c-l>", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<c-l>", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })
    end
  }

  --[[
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    behaviour = {
      auto_suggestions = true,
    },
    opts = {
      -- Here is the specific Ollama configs from the GH issue
      auto_suggestions_provider = "ollama",
      debug = true,
      provider = "ollama",

      --[[
      vendors = {
        -- ollama = ollama,
        ollama = {
          api_key_name = "",
          endpoint = "http://ollama.ollama.svc.cluster.local:11434",
          -- endpoint = "http://ollama.ollama.svc.cluster.local:11434/v1",
          -- NOTE: This model does not support snippet generation
          -- model = "codellama:13b",
          model = "codegemma:7b",
          -- model = "opencoder:8b",
          timeout = 30000, -- timeout in milliseconds
          temperature = 0, -- adjust if needed
          -- May need to adjust if the file is large
          max_tokens = 4096,
          parse_messages = parse_messages,
          parse_curl_args = parse_curl_args,
          parse_stream_data = parse_stream_data,
        },
      },
      ]]  --

      --[[
      -- This was the suggested setup from the GH page
      provider = "ollama",
      vendors = {
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          -- NOTE: This will only work when connected to local network...
          endpoint = "http://ollama.ollama.svc.cluster.local:11434/v1",
          -- NOTE: This model does not support snippet generation
          -- model = "llama3.2:3b",
          model = "llama3.2:3b-32kctx",
          -- model = "codellama:13b",
          -- model = "codegemma:7b",
          -- model = "opencoder:8b",
          -- model = "codellama:13b-instruct-q8_0",
          timeout = 30000, -- timeout in milliseconds
          temperature = 0, -- adjust if needed
          --
          -- May need to adjust if the file is large
          -- max_tokens = 4096,
          max_tokens = 30000,
          --
          -- NOTE: This needed to be added if tools are not supported on the model
          --   FWIW all ollama models will not support tools
          disable_tools = true,
        },
      },
      --]]

      -- Another GH issue with a solution
      --[[
      vendors = {
        ---@type AvanteProvider
        ollama = {
            api_key_name = "",
            ask = "",
            endpoint = "http://ollama.ollama.svc.cluster.local:11434/api",
            -- model = "codellama:13b",
            -- model = "codegemma:7b",
            model = "llama3.2:3b",
            -- NOTE: Since we override these commands, we implicitly disable the use of tools,
            --   so this is not going to complain about it
            parse_curl_args = function(opts, code_opts)
                return {
                    url = opts.endpoint .. "/chat",
                    headers = {
                        ["Accept"] = "application/json",
                        ["Content-Type"] = "application/json",
                    },
                    body = {
                        model = opts.model,
                        options = {
                            num_ctx = 16384,
                        },
                        messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
                        stream = true,
                    },
                }
            end,
            parse_stream_data = function(data, handler_opts)
                -- Parse the JSON data
                local json_data = vim.fn.json_decode(data)
                -- Check for stream completion marker first
                if json_data and json_data.done then
                    handler_opts.on_complete(nil)  -- Properly terminate the stream
                    return
                end
                -- Process normal message content
                if json_data and json_data.message and json_data.message.content then
                    -- Extract the content from the message
                    local content = json_data.message.content
                    -- Call the handler with the content
                    handler_opts.on_chunk(content)
                end
            end,
        },
      },
      -- ]] --
    --[[
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      --[[
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      --]
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
  --]]

}
