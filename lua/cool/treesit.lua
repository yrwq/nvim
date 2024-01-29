local options = {
    ensure_installed = {
        "typescript",
        "tsx",
        "lua",
        "svelte",
        "c",
        "css",
        "markdown",
        "python",
        "ruby",
        "rust",
        "html",
        "json",
        "astro",
        "scss",
        "vim",
        "bash",
        "vimdoc",
        "make",
        "toml",
        "vue",
        "zig"
    },


    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = false },
    autotag = { enable = true },

    refactor = {
        highlight_current_scope = { enable = true },
    },


}

return options
