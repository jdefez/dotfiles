--------------------------------------------------------------------------------
-- colorschemes
--------------------------------------------------------------------------------

-- TODO: test:
-- - farba scheme https://github.com/shushtain/farba.nvim

-- local option = vim.opt
local cmd = vim.cmd

cmd("hi statusline guibg=NONE")
cmd("hi DiagnosticUnderlineError gui=undercurl")
cmd("hi DiagnosticUnderlineWarn gui=undercurl")

-- require('colorschemes.shades-of-purple')
-- require('colorschemes.doric-themes')
require('colorschemes.rose-pine')
-- require('colorschemes.mac-clear')
-- require('colorschemes.catppuccin')
-- require('colorschemes.kanagawa')
-- require('colorschemes.doom-one')
-- require('colorschemes.nightingale')
-- require('colorschemes.pastel')
-- require('colorschemes.mfd')
