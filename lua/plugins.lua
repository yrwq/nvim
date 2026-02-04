local init = {
  -- debugging

  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("cool.dap")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
      })
    end,
  },

  --
  -- qol
  --

  {
    dir = "~/Developer/Repos/yang/extra/nvim-ylang",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("yang").setup()
    end,
  },

  "tpope/vim-commentary",

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("cool.gitsigns")
    end,
  },

  -- better buffer deletion
  "moll/vim-bbye",

  -- guess indentation in buffer
  { "nmac427/guess-indent.nvim", lazy = false, priority = 50 },

  -- automatic "" {} () ''
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({})
    end,
    opts = {},
  },

  -- Highlight arguments' definitions and usages, asynchronously, using Treesitter
  {
    "m-demare/hlargs.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("hlargs").setup()
    end
  },

  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- add, delete, change surroundings
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- highlight todo comments
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    enabled = true,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
      })
    end
  },


  --
  -- themes
  --

  {
    -- "https://github.com/yrwq/paper",
    dir = "~/Developer/Repos/paper-nvim",
    config = function ()
      require("paper")
    end
  },

  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   opts = {
  --   }
  -- },

  -- {
  --   "sainnhe/gruvbox-material",
  --   config = function()
  --     vim.o.background = "dark"
  --     vim.o.termguicolors = true
  --     -- vim.cmd("let g:gruvbox_material_background = 'hard'")
  --   end
  -- },


  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   config = function()
  --     vim.o.background = "dark"
  --     vim.o.termguicolors = true
  --   end
  -- },

  --
  -- ui
  --

  -- git integration
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    }
  },


  -- better syntax hl
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function()
      return require("cool.treesit")
    end,
    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = "VeryLazy",
    opts = {},
  },

  {
    "davidmh/mdx.nvim",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
  },

  -- git status, todo in sidebar
  {
    "sidebar-nvim/sidebar.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = function()
      require("cool.sidebar")
    end,
  },

  -- file browsers

  -- tree
  {
    "kyazdani42/nvim-tree.lua",
    opts = function() require("nvim-tree").setup {
    } end
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },

  -- fm
  {
    "stevearc/oil.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ["<CR>"] = "actions.select",
          ["<C-p>"] = "actions.preview",
          ["q"] = "actions.close",
          ["g."] = "actions.toggle_hidden",
        },
        float = {
          padding = 3,
          border = "rounded",
        },
      })
    end,
  },

  -- status line

  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function() require("cool.statusline") end
  },

  -- buffer bar

  {
    "noib3/nvim-cokeline",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim"
    },
    opts = function()
      require("cool.bufbar")
    end
  },

  -- colorize hex,rgb, hsl bg

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      vim.o.termguicolors = true
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          css = true,
          mode = "background",
          tailwind = true,
        }
      })
    end
  },

  --
	-- code outline sidebar
  --

  --
  -- lsp
  --

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer", "clangd" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("cool.lsp")
    end,
  },

  --
  -- completion
  --

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("cool.cmp")
    end,
  },

	{
		"hedyhli/outline.nvim",
    lazy = true,
    event = "VeryLazy",
		cmd = { "Outline", "OutlineOpen" },
		opts = function()
			local defaults = require("outline.config").defaults
			local opts = {
				symbols = {
					icons = {},
				},
				keymaps = {
					up_and_jump = "k",
					down_and_jump = "j",
				},
			}
			return opts
		end,
	},

  {
    "folke/noice.nvim",
    event = "InsertEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
    require("noice").setup({
      cmdline = { enabled = false },
      messages = { enabled = false },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      notify = { enabled = false },

      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
      views = {
        popupmenu = {
          relative = "editor",
          position = {
            row = "50%",
            col = "50%",
          },

          size = {
            width = 60,
            height = 12,
          },

          border = {
            style = "rounded",
          },

          win_options = {
            winblend = 0,
          },
        },
      },
      lsp = {
        progress = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        message = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        documentation = {
          view = "hover",
          opts = { -- lsp_docs settings
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            position = { row = 2, col = 2 },
            size = {
              max_width = 60,
              max_height = 15,
            },
            border = {
              style = "single",
            },
            win_options = {
              concealcursor = "n",
              conceallevel = 3,
            },
          },
        },
      }
    })
    end
  }
}

return require("lazy").setup({init}, {
	checker = { enabled = true },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"tohtml",
				"tutor",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "matchit"
			},
		},
	},
	debug = false,

})
