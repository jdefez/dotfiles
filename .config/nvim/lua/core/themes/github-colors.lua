vim.cmd("colorscheme github-colors")
vim.cmd("set background=light")

vim.cmd([[
  highlight DiagnosticUnderlineWarn gui=undercurl
  highlight DiagnosticUnderlineError gui=undercurl
]])
