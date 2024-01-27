local conf = require("config")

local init = {
    "folke/neodev.nvim",
    "tpope/vim-commentary",
    "airblade/vim-gitgutter",
    "tpope/vim-fugitive",

    "othree/html5.vim",
    "pangloss/vim-javascript",
    "evanleck/vim-svelte",

    "junegunn/fzf.vim",
    "junegunn/fzf",


    {
        "andweeb/presence.nvim",
        opts = function()
            if conf.rpc == true then
                require("presence").setup {} end
            end
    },

    {
        "sidebar-nvim/sidebar.nvim",
        opts = function()
            require("cool.sidebar")
        end,
    },

    {
        "sainnhe/gruvbox-material",
        config = function()
            if conf.dark == true then
                vim.o.background = "dark"
            else
                vim.o.background = "light"
            end
            vim.o.termguicolors = true
            vim.cmd("let g:gruvbox_material_background = 'hard'")
            vim.cmd("colorscheme gruvbox-material")
        end
    },


    -- {
    --     "nyoom-engineering/oxocarbon.nvim",
    --     config = function()
    --         if conf.dark == true then
    --             vim.o.background = "dark"
    --         else
    --             vim.o.background = "light"
    --         end
    --         vim.o.termguicolors = true
    --         vim.cmd.colorscheme("oxocarbon")
    --     end
    -- },

    {
        "kyazdani42/nvim-tree.lua",
        opts = function() require("nvim-tree").setup {} end
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function() require("cool.statusline") end
    },

    {
        "noib3/nvim-cokeline",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "nvim-lua/plenary.nvim"
        },
        opts = function()
            require("cool.bufbar")
        end
    },

    {
        "norcalli/nvim-colorizer.lua",
        opts = function()
            vim.o.termguicolors = true
            require("colorizer").setup({"css"; }, { mode = "background" })
        end
    },

    {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
	build = "make install_jsregexp"
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "rafamadriz/friendly-snippets",
        },
        opts = function() require("cool.completion") end
    },

    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow"
    },

    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    },

    --
    -- scope
    --
    
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function() require("cool.scope") end
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.2",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require("cool.treesit")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
      },

    { "peitalin/vim-jsx-typescript" },

    {
        "lmburns/lf.nvim",
        opts = function()
            vim.g.lf_netrw = 1
            require("lf").setup({
                escape_quit = false,
                border = "rounded",
            })
        end,
        dependencies = {"akinsho/toggleterm.nvim"}
    },

}

return require("lazy").setup(init)
