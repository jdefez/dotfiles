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

option.background = "light"
cmd.colorscheme "vscode"
