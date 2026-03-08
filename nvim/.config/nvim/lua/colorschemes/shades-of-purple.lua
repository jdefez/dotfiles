--------------------------------------------------------------------------------
-- Shades of Purple colorscheme
--------------------------------------------------------------------------------

local collect = require("modules.collection").collect
local cmd = vim.cmd
local api = vim.api

vim.pack.add({
    { src = "https://github.com/necrogoru/shades-of-purple.nvim" }
})

local colors = require("shades-of-purple.colors")

-- NOTE: must be declared here
cmd.colorscheme "shades-of-purple"

collect({
    { hi = "VirtColumn", opts = { fg = colors.purple } },
}):each(function(value)
    api.nvim_set_hl(0, value.hi, value.opts)
end)
