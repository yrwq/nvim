local init = {

  --
  -- qol
  --

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
      require("todo-comments").setup({})
    end
  },

  -- nerd font picker
  {
      '2kabhishek/nerdy.nvim',
      lazy = true,
      event = "VeryLazy",
      dependencies = {
          'stevearc/dressing.nvim',
          'nvim-telescope/telescope.nvim',
      },
      cmd = 'Nerdy',
  },


  --
  -- themes
  --
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
    }
  },

  "catppuccin/nvim",
  "rose-pine/neovim",

  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.o.background = "dark"
      vim.o.termguicolors = true
      vim.cmd("let g:gruvbox_material_background = 'hard'")
    end
  },


  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      vim.o.background = "dark"
      vim.o.termguicolors = true
    end
  },

  --
	-- distraction-free
  --

	{
		"folke/zen-mode.nvim",
    lazy = true,
    event = "VeryLazy",
		cmd = 'ZenMode',
		opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
      },

			plugins = {
				gitsigns = { enabled = true },
			},
		},
	},

  --
  -- ui
  --

  -- better syntax hl
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-refactor"
    },
    opts = function()
      return require("cool.treesit")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
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
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = {
            "actions.select",
            opts = { vertical = true },
            desc = "Open the entry in a vertical split",
          },
          ["<C-h>"] = {
            "actions.select",
            opts = { horizontal = true },
            desc = "Open the entry in a horizontal split",
          },
          ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
          ["<C-p>"] = "actions.preview",
          ["q"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
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
  -- code
  --

  -- mdx highlight
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function() require("cool.lsp") end
  },

  -- fast navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "zk", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "Zk", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  --
	-- code outline sidebar
  --

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

  --
	-- completion
  --

	{
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}


      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Insert}),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),
          ['<C-y>'] = cmp.mapping.complete(),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {'i', 's'}),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {'i', 's'}),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

    end

	},

}
  --
  -- util
  --

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
