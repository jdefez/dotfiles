require("core.api")
require("core.themes")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

vim.keymap.set('', '<leader>n', ':Neotree toggle reveal right<cr>', { silent = true })

-- diffview mappings

-- <leader>co: Choose the OURS version of the conflict.
-- <leader>ct: Choose the THEIRS version of the conflict.
-- <leader>cb: Choose the BASE version of the conflict.
-- <leader>ca: Choose all versions of the conflict (effectively
--    just deletes the markers, leaving all the content).
-- dx: Choose none of the versions of the conflict (delete the
