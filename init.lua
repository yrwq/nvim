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

-- automatically changes the working directory to a given dir on entering vim
autodir = true
autodir_path = vim.fn.expand("$HOME") .. "/Desktop/dev"

require("plugins")
require("opts")
require("keys")
require("autocmds")
