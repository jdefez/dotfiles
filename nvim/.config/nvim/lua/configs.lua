local option = vim.opt

-- Options

vim.g.mapleader = " "

option.colorcolumn = "80"
option.updatetime = 250
option.swapfile = false
option.number = true
option.signcolumn = "yes"
option.wrap = false
option.expandtab = true
option.shiftwidth = 4
option.tabstop = 4
option.winborder = "rounded"
option.clipboard = "unnamedplus"
option.termguicolors = true
option.ignorecase = true
option.fillchars = { eob = " " }

-- option.listchars = "tab: ,multispace:|   ,eol:󰌑"
-- option.list = true
option.cursorline = true
option.scrolloff = 8
option.inccommand = "nosplit"

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.cmd.filetype("plugin indent on")
