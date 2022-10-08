require('basic')
require('plugins')
require('key-mapping')

-- require('dap-xdebug-adapter')

-- Lua
vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
vim.cmd('colorscheme catppuccin')

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
