local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- show outline
-- autocmd("VimEnter", {
--     command = "Outline"
-- })

-- do not auto comment new lines
autocmd("BufEnter", {
    pattern = '',
    command = "set fo-=c fo-=r fo-=o"
})


-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})
