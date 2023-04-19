require("core.api")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

-- default scheme

vim.cmd("colorscheme monokai-pro")
vim.cmd("set background=dark")

vim.cmd([[nnoremap <leader>n :Neotree toggle reveal right<cr>]])
vim.cmd([[nnoremap <leader>b :Neotree toggle show buffers right<cr>]])
vim.cmd([[nnoremap <leader>s :Neotree float git_status<cr>]])
