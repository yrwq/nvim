local map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

--
-- buffer
--

map('n', '<leader>j', ':bp<cr>', opts)
map('n', '<leader>k', ':bn<cr>', opts)
map('n', '<leader>x', ':bd<cr>', opts)

map("n", "<leader>a", [[<cmd>vertical resize +5<cr>]], opts)
map("n", "<leader>d", [[<cmd>vertical resize -5<cr>]], opts)
map("n", "<leader>w", [[<cmd>horizontal resize +2<cr>]], opts)
map("n", "<leader>s", [[<cmd>horizontal resize -2<cr>]], opts)

map('n', '<leader>d',     ':Telescope find_files<cr>', opts)
-- map('n', '<leader>f',     ':Telescope file_browser<cr>', opts)
map('n', '<leader>f',     ':Lf<cr>', opts)

map('n', '<leader>t',     ':NvimTreeToggle<cr>', opts)
map('n', '<leader>o',     ':FZF<cr>', opts)

map("n", "L", ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", opts)


for i = 1,9 do
    map('n', ('<leader>%s'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i), opts)
end

