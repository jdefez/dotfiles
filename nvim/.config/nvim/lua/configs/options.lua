--------------------------------------------------------------------------------
-- neovim options
--------------------------------------------------------------------------------

local option = vim.opt
local window = vim.wo

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
option.pumborder = 'rounded'
option.clipboard = "unnamedplus"
option.termguicolors = true
option.ignorecase = true
option.fillchars = { eob = " " }
option.cursorline = true
option.scrolloff = 8
option.inccommand = "nosplit"
option.splitbelow = true
option.splitright = true
option.autocomplete = true
option.completeopt = { "menu", "menuone", "noselect", "nearest", "preview", "fuzzy" }
option.complete = { ".", "w", "b", "u" }


window.foldmethod = 'expr'
window.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 99      -- start with all folds open
vim.o.foldlevelstart = 99 -- same, for new buffers
vim.o.foldenable = true   -- enable folding

vim.cmd.filetype("plugin indent on")
