require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    -- open = true,
    side = "right",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "buffers", "datetime", "git", "files" },
    section_separator = {"", "-----", ""},
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    buffers = {
        icon = "",
        ignored_buffers = {}, -- ignore buffers by regex
        sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
    },
    files = {
        icon = "",
        show_hidden = false,
        ignored_paths = {"%.git$"}
    }
})
