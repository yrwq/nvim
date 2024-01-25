local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "c", "lua", "css", "markdown", "python", "ruby", "rust",
        "javascript", "html", "json", "astro", "scss", "svelte",
        "vim", "bash", "vimdoc", "make", "toml", "typescript", "vue",
        "zig", "query"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})
