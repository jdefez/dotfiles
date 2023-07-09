vim.g.one_allow_italics = true
vim.cmd("colorscheme one")
vim.cmd("set background=dark")

vim.cmd([[
  highlight DiagnosticUnderlineWarn gui=undercurl
  highlight DiagnosticUnderlineError gui=undercurl
]])
