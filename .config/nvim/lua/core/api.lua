vim.g.python3_host_prog = '/usr/bin/python'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.termguicolors = true
vim.wo.colorcolumn = '80'
vim.opt.autowrite = true
vim.wo.relativenumber = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.wo.number = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.signcolumn = 'yes'
vim.opt.fillchars = { eob = " " }

vim.opt.foldmethod = 'indent'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.ignorecase = true
vim.opt.smartcase = false
vim.opt.wrap = false
vim.opt.scrolloff = 8     -- number of screen lines to show around the cursor
vim.opt.sidescrolloff = 8 -- number of screen lines to show around the cursor
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.winminwidth = 0
vim.opt.termguicolors = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.title = true
vim.opt.mouse = 'a'
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '~ ', trail = '.' }
vim.opt.backup = true
vim.opt.backupdir:remove('.') -- no backup file in the current dir
-- vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.g.markdown_recommended_style = 0

vim.cmd [[
  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html
  au BufRead,BufNewFile *.neon set ft=yaml

  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype json setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd Filetype yaml setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype lua setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd Filetype go setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
]]
