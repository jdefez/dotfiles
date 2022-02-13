require('basic')

require('plugins')

require('key-mapping')

require('lsp-servers')

require('lualine-bubble')

require('dap-xdebug-adapter')

-- vim.cmd('colorscheme catppuccin')

vim.g.tokyonight_style = 'storm'
vim.cmd('colorscheme tokyonight')

vim.cmd [[
  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html

  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " phpactor: avoiding creation of variables with 2 $ sign

  autocmd FileType phpset iskeyword+=$
  autocmd FileType php setlocal omnifunc=phpactor#Complete

  " dap: enabling autocompletion

  au FileType dap-repl lua require("dap.ext.autocompl").attach()
]]
