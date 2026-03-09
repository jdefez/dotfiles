--------------------------------------------------------------------------------
-- shades-of-purple
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/necrogoru/shades-of-purple.nvim" }
})

-- require("shades-of-purple").setup()
vim.cmd("colorscheme shades-of-purple")

local collect = require("modules.collection").collect
local colors = require("shades-of-purple.colors")
local highlights = collect({
    { hi = "VirtColumn", opt = {fg = colors.purple} },
}):each(function(value)
    vim.api.nvim_set_hl(0, value.hi, value.opt)
end)
