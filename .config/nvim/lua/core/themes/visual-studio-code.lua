require("visual_studio_code").setup({
  mode = "light",
})

vim.cmd("colorscheme visual_studio_code")

vim.cmd([[
  highlight DiagnosticUnderlineWarn gui=undercurl
  highlight DiagnosticUnderlineError gui=undercurl
  highlight NoiceCursor guibg=gray
]])
