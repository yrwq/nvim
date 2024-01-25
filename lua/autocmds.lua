local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- do not auto comment new lines
autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})

-- open sidebar
autocmd('BufEnter', {
    pattern = '',
    command = 'SidebarNvimOpen'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
    group = 'setIndent',
    pattern = { 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml' },
    command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2'
})

if autodir == true then
  autocmd(
      {"VimEnter"},
      { pattern = "*", command = "cd " .. autodir_path, group = vim_enter_group }
  )
end
