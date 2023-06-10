require("core.api")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

-- default scheme

-- vim.cmd("colorscheme monokai-pro")
-- vim.cmd("set background=dark")

-- vim.cmd("colorscheme nordfox")
-- vim.cmd("set background=dark")

vim.cmd("colorscheme tokyonight-day")
vim.cmd("set background=light")

-- neotree key mappings

vim.keymap.set('', '<leader>n', ':Neotree toggle reveal right<cr>', { silent = true })
