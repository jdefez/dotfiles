--------------------------------------------------------------------------------
-- neovim options
--------------------------------------------------------------------------------

local option = vim.opt

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

option.cursorline = true
option.scrolloff = 8
option.inccommand = "nosplit"

option.splitbelow = true
option.splitright = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 10
vim.wo.foldminlines = 0
vim.wo.foldnestmax = 10

vim.cmd.filetype("plugin indent on")
