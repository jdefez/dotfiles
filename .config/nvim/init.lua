require("core.api")
require("core.keymaps")

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

-- TODO: check plugins:
--  - https://github.com/ray-x/lsp_signature.nvim

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- diffview mappings

-- <leader>co: Choose the OURS version of the conflict.
-- <leader>ct: Choose the THEIRS version of the conflict.
-- <leader>cb: Choose the BASE version of the conflict.
-- <leader>ca: Choose all versions of the conflict (effectively just deletes the
--  markers, leaving all the content).
-- dx: Choose none of the versions of the conflict (delete the
