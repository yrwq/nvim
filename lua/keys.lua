local map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

--
-- window nav
--

map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)

--
-- buffer
--

-- previous buffer
map("n", "H", ":bp<cr>", opts)
-- next buffer
map("n", "L", ":bn<cr>", opts)
-- delete buffer
map("n", "<leader>q", ":Bdelete<cr>", opts)
map("n", "Q", ":Bdelete<cr>", opts)

-- switch buffer
for i = 1,9 do
    map("n", ("<leader>%s"):format(i),      ("<Plug>(cokeline-focus-%s)"):format(i), opts)
end

--
-- util
--

-- fast save
map("n", "<leader>s", ":w<cr>", opts)
-- fast yank
map("n", "Y", "yy", opts)
-- disable higlight
map("n", "<Tab>", ":noh<cr>", opts)
-- go to new line from any cursor pos in insert mode
map("i", "<S-Return>", "<C-o>o", opts)

map("n", "<leader>t", ":NvimTreeToggle<cr>", opts)
map("n", "<leader>T", ":SidebarNvimToggle<cr>", opts)
map("n", "<leader>O", ":Outline<cr>", opts)
map("n", "<leader>f", ":Oil<CR>", opts)
map("n", "<leader>n", ":lua require('oil').toggle_float()<CR>", opts)

vim.keymap.set("n", "ff", ":FzfLua global<CR>", { remap = true, silent = true })
vim.keymap.set("n", "F", ":FzfLua live_grep<CR>", { remap = true, silent = true })

--
-- lsp
--

map("n", "K", ":lua vim.lsp.buf.hover()<cr>", opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
map("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", opts)
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>", opts)


map("n", "<leader>,", ":ZenMode<cr>", opts)
