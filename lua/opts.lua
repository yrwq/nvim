local cmd = vim.cmd

vim.o.termguicolors = true

cmd[[
set nocompatible
syntax enable
filetype plugin indent on
]]

-- global opts
vim.o.background = "dark"
vim.o.hidden = true
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.clipboard = "unnamedplus"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.number = true
vim.o.ignorecase = true
vim.o.formatoptions = ""
vim.o.hlsearch = true
vim.o.undofile = true
vim.o.swapfile = false

-- buffer specific
vim.b.tabstop = 4
vim.b.shiftwidth = 4
vim.b.softtabstop = 4
vim.b.expandtab = true
vim.b.smartindent = true
vim.b.autoread = true

-- window specific
vim.w.noswapfile = true
vim.w.signcolumn = "yes"

vim.g.mapleader = " "


cmd[[
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
  ]]
