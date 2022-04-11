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

require('dap-xdebug-adapter')

vim.g.tokyonight_style = 'day'
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.cmd('colorscheme tokyonight')

--[[ vim.g.nightflyCursorColor = 1
vim.g.nightflyItalics = 1
vim.cmd('colorscheme nightfly') ]]

-- Available: `nature` or `neon`.
--[[ vim.g.enfocado_style = 'nature'
vim.cmd('colorscheme enfocado') ]]

vim.cmd [[
  " colorcolumn
  highlight ColorColumn guibg=#F3F3F3

  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html

  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " avoiding phpactor to create variables with 2 $ sign
  autocmd FileType phpset iskeyword+=$
  autocmd FileType php setlocal omnifunc=phpactor#Complete
]]
