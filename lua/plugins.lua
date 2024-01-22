vim.cmd "packadd cfilter"
vim.cmd "packadd packer.nvim"

local init = function()
    use {
        "wbthomason/packer.nvim",
        opt = true
    }

    use "tpope/vim-commentary"

    use 'nvim-lua/popup.nvim'
    use "nvim-lua/plenary.nvim"

    use {
        "kyazdani42/nvim-tree.lua",
        config = function() require'nvim-tree'.setup {} end
    }

    use {
        "ojroques/nvim-hardline",
        config = function() require("cool.hardline") end
    }

    use {
        "noib3/nvim-cokeline",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("cool.bufbar")
        end
    }

    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require 'colorizer'.setup({
                'css';
                'svelte';
                'javascript';
                html = { mode = 'background' };
            }, { mode = 'background' })
        end
    }

    use "sainnhe/gruvbox-material"

    use "airblade/vim-gitgutter"
    use "tpope/vim-fugitive"

	use {
		"sidebar-nvim/sidebar.nvim",

		config = function()
			require("cool.sidebar")
		end,
	}

    use 'othree/html5.vim'
    use 'pangloss/vim-javascript'
    use 'evanleck/vim-svelte'
    use 'wuelnerdotexe/vim-astro'
    use 'junegunn/fzf.vim'
end

return require("packer").startup(init)
