local map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

map('n', '<A-j>',   ':bp<cr>', opts)
map('n', '<A-k>',   ':bn<cr>', opts)
map('n', '<leader>w',     ':bdelete<cr>', opts)

map('n', '<leader>o',     ':FZF<cr>', opts)

map('n', '<leader>f',     ':NvimTreeToggle<cr>', opts)

for i = 1,9 do
    map('n', ('<leader>%s'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i), opts)
end
