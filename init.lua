local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- clone lazy.nvim
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("plugins")
require("opts")
require("keys")
require("autocmds")
require("theme")
