vim.g.mapleader = ' '
vim.wo.colorcolumn = '80'
vim.wo.relativenumber = false
vim.wo.number = true
vim.opt.autowrite = true

vim.opt.expandtab = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.signcolumn = 'yes'
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append({ W = true, I = true, c = true, s = true })
vim.opt.pumblend = 10
vim.opt.pumheight = 10

vim.opt.foldmethod = 'indent'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.scrolloff = 8     -- number of screen lines to show around the cursor
vim.opt.sidescrolloff = 8 -- number of screen lines to show around the cursor
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
-- vim.opt.undolevels = 10000
vim.opt.termguicolors = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.title = true
vim.opt.mouse = 'a'
vim.opt.list = true
vim.opt.listchars = { tab = '~ ', trail = '.' }
vim.opt.backup = true
vim.opt.backupdir:remove('.') -- no backup file in the current dir
-- vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.spelllang = { "en", "fr" }

vim.cmd [[
  " Specific syntax settings
  au BufRead,BufNewFile *.blade.php set ft=html
  au BufRead,BufNewFile *.neon set ft=yaml

  autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " autocmd Filetype json setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  " autocmd Filetype xml setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  " autocmd Filetype lua setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
]]
