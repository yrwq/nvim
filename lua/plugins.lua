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
        "sidebar-nvim/sidebar.nvim",
        opts = function()
            require("cool.sidebar")
        end,
    },

    {
        "sainnhe/gruvbox-material",
        opts = function() vim.cmd("colorscheme gruvbox-material") end
    },

    {
        "kyazdani42/nvim-tree.lua",
        opts = function() require("nvim-tree").setup {} end
    },

    {
        "ojroques/nvim-hardline",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lualine/lualine.nvim"
        },
        opts = function() require("cool.hardline") end
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
	    build = "make install_jsregexp"
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        opts = function() require("cool.completion") end
    },

    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        event = 'BufEnter',
        opts = function()
            require("codeium").setup({
                language_server = "codeium",
            })
        end
    },

    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow"
    }
}

return require("lazy").setup(init)
