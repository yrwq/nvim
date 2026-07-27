local init = {
    --
    -- qol
    --
    "tpope/vim-commentary",

    -- add, delete, change surroundings
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },


    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("cool.gitsigns")
        end,
    },

    -- buffer deletion
    "moll/vim-bbye",

    -- guess indentation in buffer
    {
        "nmac427/guess-indent.nvim",
        lazy = false, priority = 50
    },

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

    -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
    {
        "joosepalviste/nvim-ts-context-commentstring",
        lazy = true
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
                colors = {
                    error = { "DiagnosticError" },
                    warning = { "DiagnosticWarn" },
                    info = { "DiagnosticInfo" },
                    hint = { "DiagnosticHint" },
                    default = { "Identifier" },
                    test = { "Identifier" }
                },
            })
        end
    },

    -- auto close html tags
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        event = "VeryLazy",
        opts = {},
    },


    --
    -- themes
    --

    -- {
    --     "https://github.com/nyoom-engineering/oxocarbon.nvim",
    --     config = function()
    --         vim.cmd("colorscheme oxocarbon")
    --     end
    -- },

    {
        "miikanissi/modus-themes.nvim", priority = 1000,
        config = function()
            vim.o.background = "light"
            vim.o.termguicolors = true
            vim.cmd("colorscheme modus")
        end
    },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.opt.background = "dark"
                vim.cmd("set background=dark")
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.opt.background = "light"
                vim.cmd("set background=light")
                -- vim.cmd("colorscheme catppuccin-latte")
            end,
            update_interval = 3000,
            fallback = "dark"
        }
    },

    -- {
    --     "sainnhe/gruvbox-material",
    --     config = function()
    --         vim.o.background = "dark"
    --         vim.o.termguicolors = true
    --         vim.cmd("let g:gruvbox_material_background = 'hard'")
    --         -- vim.cmd('colorscheme gruvbox-material')
    --     end
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
    },


    -- syntax hl
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

    -- file tree
    {
        "kyazdani42/nvim-tree.lua",
        opts = function()
            require("nvim-tree").setup {
            }
        end
    },

    -- fuzz
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            file_ignore_patterns = {
                "node_modules/", "dist/", ".git/", "build/", "target/", "package-lock.json",
            },
        },
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

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        -- -@module 'render-markdown'
        -- -@type render.md.UserConfig
        opts = {},
    },

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
                ensure_installed = { "rust_analyzer" },
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
            "hrsh7th/cmp-buffer",
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
        lazy = false,
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

return require("lazy").setup({ init }, {
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
