local dap = require("dap")

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

-- disable higlight
map("n", "<Esc>", ":noh<cr>", opts)

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

map("n", "H", ":bp<cr>", opts)
map("n", "L", ":bn<cr>", opts)
map("n", "Q", ":Bdelete<cr>", opts)

-- switch buffer
for i = 1,9 do
    map("n", ("<leader>%s"):format(i),      ("<Plug>(cokeline-focus-%s)"):format(i), opts)
end

--
-- util
--

map("n", "<leader>t", ":NvimTreeToggle<cr>", opts)
map("n", "<leader>O", ":Outline<cr>", opts)
map("n", "<leader>gg", ":Neogit<cr>", opts)

map("n", "D", ":FzfLua git_diff<CR>", opts)
map("n", "F", ":FzfLua live_grep<CR>", opts)
map("n", "fr", ":FzfLua lsp_references<CR>", opts)
map("n", ",", ":FzfLua buffers<CR>", opts)
map("n", "<leader>ft", ":FzfLua btags<CR>", opts)
map("n", "<leader>fd", ":FzfLua diagnostics_workspace<CR>", opts)

vim.keymap.set("n", "ff", function()
  local fzf = require("fzf-lua")
  local root = fzf.path.git_root({ cwd = vim.fn.getcwd() }) -- safe
  fzf.files({ cwd = root or vim.fn.getcwd() })
end, { desc = "Find files (git root)" })
--
-- lsp
--

-- map("n", "K", ":lua vim.lsp.buf.hover()<cr>", opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
map("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", opts)
map("n", "<leader>lf", ":lua vim.lsp.buf.format()<cr>", opts)
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>", opts)

-- scroll in hover
vim.keymap.set({"n", "i", "s"}, "<C-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<C-f>"
  end
end, { silent = true, expr = true })

vim.keymap.set({"n", "i", "s"}, "<C-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<C-b>"
  end
end, { silent = true, expr = true })
