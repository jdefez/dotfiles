require("core.dotfiles")
require("core.api")
require("core.keymaps")
require("core.lazy")
require("core.lsp")

-- cursor customization

vim.o.guicursor = "n-v-c-sm-i-ci-ve:hor25,r-cr-o:hor25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
vim.cmd([[
  hi Cursor guifg=red guibg=red
  hi lCursor guifg=red guibg=red
]])
