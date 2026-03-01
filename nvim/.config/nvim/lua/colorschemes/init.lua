local cmd = vim.cmd

cmd("hi statusline guibg=NONE")
cmd("hi DiagnosticUnderlineError gui=undercurl")
cmd("hi DiagnosticUnderlineWarn gui=undercurl")

-- require('colorschemes.rose-pine')
-- require('colorschemes.monochrome')
-- require('colorschemes.selenized')
-- require('colorschemes.github')
require('colorschemes.koda')
