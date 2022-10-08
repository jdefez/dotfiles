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

vim.cmd [[
  " Specific syntax settings

  au BufRead,BufNewFile *.blade.php set ft=html
  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " avoiding phpactor to create variables with 2 $ sign

  autocmd FileType php set iskeyword+=$
  autocmd FileType php setlocal omnifunc=phpactor#Complete
]]
