local nvim_lsp = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
  "bashls",
  "clangd",
  "css_variables",
  "cssls",
  "eslint",
  "html",
  "mdx_analyzer",
  "pyright",
  "texlab",
  "ts_ls",
  "tailwindcss",
  "rust_analyzer",
}


-- require("lspconfig").denols.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }

-- require("lspconfig").ts_ls.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("package.json"),
--   single_file_support = false
-- }

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      procMacro = {
        ignored = {
            leptos_macro = {
                "component",
                "server",
            },
        },
      },
    },
  }
}


nvim_lsp["mdx_analyzer"].setup({
    filetypes = { "markdown.mdx", "mdx" },
    capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = false
    }
)
