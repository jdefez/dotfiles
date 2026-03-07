--------------------------------------------------------------------------------
-- colorschemes
--------------------------------------------------------------------------------

-- local option = vim.opt
local cmd = vim.cmd

cmd("hi statusline guibg=NONE")
cmd("hi DiagnosticUnderlineError gui=undercurl")
cmd("hi DiagnosticUnderlineWarn gui=undercurl")

-- require('colorschemes.rose-pine')
require('colorschemes.shades-of-purple')
-- require('colorschemes.doom-one')
