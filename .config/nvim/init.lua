require("core.api")
require("core.dotfiles")
require("core.keymaps")
require("core.lazy")
require("core.lsp")

vim.cmd([[
  colorscheme default
  highlight DiagnosticUnderlineError gui=undercurl
  highlight DiagnosticUnderlineWarn gui=undercurl
]])
