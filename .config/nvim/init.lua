require("core.api")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

vim.cmd("colorscheme monokai-pro")
-- vim.o.background = "light"

vim.keymap.set('', '<leader>n', ':Neotree toggle reveal right<cr>')
vim.cmd([[nnoremap <leader>o :SymbolsOutline<cr>]])
vim.cmd([[nnoremap <leader>G :Git<cr>]])
