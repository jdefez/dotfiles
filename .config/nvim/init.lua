require('basic')

require('plugins')

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

require('key-mapping')

require('lsp-servers')

require('nvim-cmp')

require('lualine-bubble')

vim.cmd [[
  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html

  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " avoiding phpactor to create variables with 2 $ sign
  autocmd FileType phpset iskeyword+=$
  autocmd FileType php setlocal omnifunc=phpactor#Complete

  " abbreviations
  autocmd FileType php iabbrev <buffer> t@ /** @test */<CR>
]]
