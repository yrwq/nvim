local dap = require("dap")

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
map("n", "<leader>gg", ":Neogit<cr>", opts)

-- map("n", "ff", ":FzfLua global<CR>", opts)
map("n", "F", ":FzfLua live_grep<CR>", opts)
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
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>", opts)

--
-- dap
--

vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dO", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.repl.open)
vim.keymap.set("n", "<leadear>dl", dap.run_last)

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

function _G.set_terminal_keymaps()
  local opt = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opt)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opt)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
