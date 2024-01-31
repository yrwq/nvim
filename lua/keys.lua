local map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

--
-- buffer
--

map('n', '<leader>h', ':bp<cr>', opts)
map('n', '<leader>l', ':bn<cr>', opts)
map('n', '<leader>q', ':bd<cr>', opts)

-- fast save
map("s", "<leader>s", ":w<cr>", opts)

vim.keymap.set("n", "<leader>j", "<C-w>h", {})
vim.keymap.set("n", "<leader>k", "<C-w>l", {})


map('n', '<leader>d',     ':Telescope find_files<cr>', opts)
-- map('n', '<leader>f',     ':Telescope file_browser<cr>', opts)
map('n', '<leader>f',     ':Lf<cr>', opts)

map('n', '<leader>t',     ':NvimTreeToggle<cr>', opts)
map('n', '<leader>o',     ':FZF<cr>', opts)

map("n", "L", ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", opts)


for i = 1,9 do
    map('n', ('<leader>%s'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i), opts)
end

