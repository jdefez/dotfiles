---@diagnostic disable: undefined-global
require('basic')

require('plugins')

require('nullls')

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

require('key-mapping')

require('lsp-servers')

require('dap-xdebug-adapter')

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]

vim.cmd [[
  " colorcolumn
  highlight ColorColumn guibg=#222222

  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html

  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " avoiding phpactor to create variables with 2 $ sign
  autocmd FileType php set iskeyword+=$
  autocmd FileType php setlocal omnifunc=phpactor#Complete
]]
