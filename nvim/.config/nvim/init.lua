require('configs')
require('plugins')

require('lsp')
require('treesitter')

require('keymaps')

require("mason").setup({})

vim.cmd("hi statusline guibg=NONE")
vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")

-- vim.cmd("colorscheme vague")
