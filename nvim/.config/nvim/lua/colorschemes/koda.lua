--------------------------------------------------------------------------------
-- Koda
--------------------------------------------------------------------------------

local option = vim.opt
local cmd = vim.cmd

vim.pack.add({
    {
        src = "https://github.com/oskarnurm/koda.nvim",
    },
})

cmd.colorscheme "koda"
