local map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

--
-- buffer
--

map('n', '<leader>j>',   ':bp<cr>', opts)
map('n', '<leader>k>',   ':bn<cr>', opts)
map('n', '<leader>w',     ':bdelete<cr>', opts)



--
-- scope
--

map('n', '<leader>d',     ':Telescope find_files<cr>', opts)
map('n', '<leader>f',     ':Telescope file_browser<cr>', opts)

map('n', '<leader>t',     ':NvimTreeToggle<cr>', opts)
map('n', '<leader>o',     ':FZF<cr>', opts)

for i = 1,9 do
    map('n', ('<leader>%s'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i), opts)
end
