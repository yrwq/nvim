local conf = {}

-- automatically changes the working directory to a given dir on entering vim
conf.autodir = false
-- path to change if autodir is enabled
conf.autodir_path = vim.fn.expand("$HOME") .. "/Desktop/dev"

-- whether to enable dark mode
conf.dark = true

-- whether to enable discord rpc
conf.rpc = true

return conf
