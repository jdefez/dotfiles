require('basic')

vim.cmd[[
  set t_ZH=^[[3m
  set t_ZR=^[[23m
]]

require('plugins')

require('null-ls')

require('key-mapping')

require('lsp-servers')

require('dap-xdebug-adapter')

-- vim.g.tokyonight_style = 'night'
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_italic_comments = true
-- vim.g.tokyonight_italic_keywords = true
-- vim.cmd('colorscheme tokyonight')

-- Lua
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd('colorscheme catppuccin')

vim.cmd[[
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

  " lsp illuminate

  autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

  highlight def link LspReferenceText CursorLine
  highlight def link LspReferenceWrite CursorLine
  highlight def link LspReferenceRead CursorLine

  " set colorcolum color
  highlight ColorColumn ctermbg=black guibg=black

  " enable italic
  " highlight Comment cterm=italic
]]

-- neovide-qt
--[[ if exists(':GuiTabline')
    GuiTabline 0
endif ]]
