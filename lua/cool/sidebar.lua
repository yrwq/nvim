require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 30,
    hide_statusline = true,
    -- update_interval = 1000,
    sections = { "todos", "git" },
    section_separator = {"", "-----", ""},
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
})
