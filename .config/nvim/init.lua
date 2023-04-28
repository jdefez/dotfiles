require("core.api")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

-- default scheme

vim.cmd("colorscheme monokai-pro")
vim.cmd("set background=dark")

-- todo fix: this should not need to be here
vim.cmd([[nnoremap <leader>n :Neotree toggle reveal right<cr>]])
vim.cmd([[nnoremap <leader>b :Neotree toggle show buffers right<cr>]])
vim.cmd([[nnoremap <leader>s :Neotree float git_status<cr>]])
vim.cmd([[nnoremap <leader>o :SymbolsOutline<cr>]])
