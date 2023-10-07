require("core.api")
-- require("core.themes")
require("core.keymaps")
-- require("core.plugins")
-- require("core.plugins_config")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- vim.keymap.set('', '<leader>n', ':Neotree toggle reveal right<cr>', { silent = true })
-- vim.keymap.set('', '<leader>o', ':SymbolsOutline<cr>', { silent = true })

-- diffview mappings

-- <leader>co: Choose the OURS version of the conflict.
-- <leader>ct: Choose the THEIRS version of the conflict.
-- <leader>cb: Choose the BASE version of the conflict.
-- <leader>ca: Choose all versions of the conflict (effectively
--    just deletes the markers, leaving all the content).
-- dx: Choose none of the versions of the conflict (delete the
