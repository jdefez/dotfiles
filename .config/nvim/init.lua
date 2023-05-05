require("core.api")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

vim.cmd("colorscheme monokai-pro")
-- vim.o.background = "light"

vim.keymap.set('', '<leader>n', ':Neotree toggle reveal right<cr>')
vim.keymap.set('', '<leader>o', ':SymbolsOutline<cr>')
vim.keymap.set('', '<leader>G', ':Git<cr>')

-- diffview mappings

-- <leader>co: Choose the OURS version of the conflict.
-- <leader>ct: Choose the THEIRS version of the conflict.
-- <leader>cb: Choose the BASE version of the conflict.
-- <leader>ca: Choose all versions of the conflict (effectively
-- just deletes the markers, leaving all the content).
-- dx: Choose none of the versions of the conflict (delete the
