---@diagnostic disable: undefined-global
require('basic')
require('plugins')
require('key-mapping')
-- require('dap-xdebug-adapter')

vim.cmd [[
  " colorcolumn
  highlight ColorColumn guibg=#000000

  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html
  au BufRead,BufNewFile *.neon set ft=yaml

  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " avoiding phpactor to create variables with 2 $ sign
  " autocmd FileType php set iskeyword+=$
  autocmd FileType php setlocal omnifunc=phpactor#Complete

  " packer
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
