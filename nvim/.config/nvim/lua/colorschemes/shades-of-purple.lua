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

collect({
    { hi = "VirtColumn", opts = { fg = colors.yellow } }
}):each(function(value)
    api.nvim_set_hl(0, value.hi, value.opts)
end)

-- api.nvim_set_hl(0, "VirtColumn", { fg = "#FF9D00" })

cmd.colorscheme "shades-of-purple"
