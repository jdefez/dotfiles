--------------------------------------------------------------------------------
-- colorschemes
--------------------------------------------------------------------------------

-- local option = vim.opt
local cmd = vim.cmd

cmd("hi statusline guibg=NONE")
cmd("hi DiagnosticUnderlineError gui=undercurl")
cmd("hi DiagnosticUnderlineWarn gui=undercurl")

-- require('colorschemes.shades-of-purple')
-- require('colorschemes.doric-themes')
require('colorschemes.rose-pine')
-- require('colorschemes.pastel')
-- require('colorschemes.doom-one')
