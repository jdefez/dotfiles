local option = vim.opt
local cmd = vim.cmd

-- mini.pick mappings : https://nvim-mini.org/mini.nvim/doc/mini-pick.html#minipick.config-defaults

require('configs')
require('plugins')
require('lsp')
require('treesitter')
require('keymaps')
require("mason").setup({})

cmd("hi statusline guibg=NONE")
cmd("hi DiagnosticUnderlineError gui=undercurl")
cmd("hi DiagnosticUnderlineWarn gui=undercurl")

--------------------------------------------------------------------------------
-- color scheme
--------------------------------------------------------------------------------

require('rose-pine').setup({
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "auto", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    highlight_groups = {
        CurSearch = { fg = "base", bg = "leaf", inherit = false },
        Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
    },
})

-- cmd.colorscheme "rose-pine-main"
-- cmd.colorscheme "rose-pine-moon"
cmd.colorscheme "rose-pine-dawn"

-- require('vscode').setup({
--     italic_comments = true,
-- })
-- option.background = "light"
