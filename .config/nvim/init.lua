require("core.api")
require("core.keymaps")
require("core.plugins")
require("core.plugins_config")

-- dark schemes

-- require("core.themes.kanagawa-theme")
-- require("core.themes.monokai-pro")
-- require("core.themes.github-dark")
-- require("core.themes.one-dark")
-- require("core.themes.spacecamp")
-- require("core.themes.nightfox")
-- require("core.themes.ayu")

-- light schemes

-- require("core.themes.catppuccin-theme")
-- require("core.themes.tokyonight-day")
-- require("core.themes.github-light")
require("core.themes.one-light")
-- require("core.themes.modus")

vim.keymap.set('', '<leader>n', ':Neotree toggle reveal right<cr>', { silent = true })
vim.keymap.set('', '<leader>o', ':SymbolsOutline<cr>', { silent = true })
vim.keymap.set('', '<leader>G', ':Git<cr>', { silent = true })

-- diffview mappings

-- <leader>co: Choose the OURS version of the conflict.
-- <leader>ct: Choose the THEIRS version of the conflict.
-- <leader>cb: Choose the BASE version of the conflict.
-- <leader>ca: Choose all versions of the conflict (effectively
--    just deletes the markers, leaving all the content).
-- dx: Choose none of the versions of the conflict (delete the
