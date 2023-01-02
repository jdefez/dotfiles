vim.g.mapleader = ' '
vim.g.termguicolors = true

vim.wo.colorcolumn = '81'
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cmdheight = 3
-- vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.cursorline = true
vim.opt.expandtab = true
-- vim.opt.foldcolumn = '0'
vim.opt.foldmethod = 'indent'
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.pumheight = 40
-- number of screen lines to show around the cursor
vim.opt.scrolloff = 1000
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
-- vim.opt.shortmess = vim.opt.shortmess:append('c')
vim.opt.showfulltag = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.tabstop = 2
vim.opt.undolevels = 10000
vim.opt.termguicolors = true

vim.cmd [[
  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html
  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " avoiding phpactor to create variables with 2 $ sign
  "autocmd FileType phpset iskeyword+=$
  "autocmd FileType php setlocal omnifunc=phpactor#Complete

  " abbreviations
  "autocmd FileType php iabbrev <buffer> t@ /** @test */<CR>
]]
