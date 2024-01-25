## neovim configuration


## todo

- set up [tailwind colorizing](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim)
- set up [surround](https://github.com/kylechui/nvim-surround)
- set up [telescope](https://github.com/nvim-telescope/telescope.nvim)
- set up [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)


## setup lsp

### bash

bashls


```bash
npm i -g bash-language-server
require'lspconfig'.bashls.setup{}
```

### C

clangd

#### mac

```bash
brew install llvm
```

### html, json, css, eslint

cssls eslint html

```bash
npm i -g vscode-langservers-extracted
```

### deno

denols

add this snippet to your configuration file to properly higlight

deno has built in language server

```lua
vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
```

### go

gopls

```bash
go install golang.org/x/tools/gopls@latest
```


### svelte

```bash
npm install --save-dev typescript-svelte-plugin
npm install -g svelte-language-server
```

setup svelte in nvim lspconfig

add plugin to your `tsconfig.json` or `jsconfig.json`

```json
{
    "compilerOptions": {
        ...
        "plugins": [{
            "name": "typescript-svelte-plugin",
            // the following options can be set additionally; they are optional; their default values are listed here
            "enabled": true, // enables this plugin
            "assumeIsSvelteProject": false // if true, skip detection and always assume it's a Svelte project
        }]
    }
}
```



### tailwind

tailwindcss

```bash
npm install -g @tailwindcss/language-server
```

### typescript

```bash
npm install -g typescript typescript-language-server
```

add plugin to your `tsconfig.json` or `jsconfig.json`

```json
{
  "compilerOptions": {
    "module": "commonjs",
    "target": "es6",
    "checkJs": false
  },
  "exclude": [
    "node_modules"
  ]
}
```

setup tsserver in nvim lspconfig
