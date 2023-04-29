require("core.api")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

-- default scheme

vim.cmd("colorscheme monokai-pro")
vim.cmd("set background=dark")

-- neotree key mappings

vim.keymap.set('', '<leader>n', ':Neotree toggle reveal right<cr>')
vim.keymap.set('', '<leader>b', ':Neotree toggle show buffers right<cr>')
vim.keymap.set('', '<leader>s', ':Neotree float git_status<cr>')
