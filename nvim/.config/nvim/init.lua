local option = vim.opt
local cmd = vim.cmd

--------------------------------------------------------------------------------
-- Load configs
--------------------------------------------------------------------------------

require('configs')
require('plugins')
require('lsp')
require('treesitter')
require('keymaps')

--------------------------------------------------------------------------------
-- Color scheme
--------------------------------------------------------------------------------

require('rose-pine').setup({
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "auto", -- main, moon, or dawn
    dim_inactive_windows = true,
    extend_background_behind_borders = true,
    highlight_groups = {
        VirtColumn = { fg = "love" },
        CurSearch = { fg = "base", bg = "leaf", inherit = false },
        Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
    },
})

-- cmd.colorscheme "rose-pine-main"
-- cmd.colorscheme "rose-pine-moon"
-- option.background = "light"

cmd.colorscheme "rose-pine-dawn"
option.background = "light"

cmd("hi statusline guibg=NONE")
cmd("hi DiagnosticUnderlineError gui=undercurl")
cmd("hi DiagnosticUnderlineWarn gui=undercurl")
