local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local servers = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
                },
            },
        },
    },
    ts_ls = {},
    hsl = {},
    pyright = {},
    zls = {},
    rust_analyzer = {},
    gopls = {},
    clangd = {
      -- cmd = { "clangd", "--compile-commands-dir=build" },
    },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help
)

for server, config in pairs(servers) do
  if next(config) ~= nil then
      vim.lsp.config(server, config)
  end
  vim.lsp.config(server, { capabilities = capabilities })
  vim.lsp.enable(server)
end

vim.diagnostic.enable = true

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.o.updatetime = 250

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "single",
      source = "always",
    })
  end,
})
