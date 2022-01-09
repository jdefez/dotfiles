vim.g.mapleader = ' '

vim.g['python3_host_prog'] = '/usr/bin/python3'

-- lsp: phpactor
-- vim.g['phpactor_executable'] = '/usr/local/bin/phpactor'
vim.g['phpactorCompletionIgnoreCase'] = true

-- vim-test:
vim.g['test#neovim#start_normal'] = true
vim.g['test#basic#start_normal'] = true
vim.g['test#echo_command'] = false
vim.g['test#neovim#term_position'] = "topright"

vim.wo.colorcolumn = '81'
vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.cmdheight = 3
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldcolumn = '0'
vim.opt.foldmethod = 'indent'
vim.opt.formatoptions = vim.opt.formatoptions:append('c') -- Autowrap comments using textwidth
vim.opt.formatoptions = vim.opt.formatoptions:append('j') -- Delete comment character when joining commented lines
vim.opt.formatoptions = vim.opt.formatoptions:append('l') -- Do not wrap lines that have been longer when starting insert mode already
vim.opt.formatoptions = vim.opt.formatoptions:append('n') -- Recognize numbered lists
vim.opt.formatoptions = vim.opt.formatoptions:append('q') -- Allow formatting of comments with gq.
vim.opt.formatoptions = vim.opt.formatoptions:append('r') -- Insert comment leader after hitting <Enter>
vim.opt.formatoptions = vim.opt.formatoptions:append('t') -- Auto-wrap text using textwidth
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.pumheight = 40
vim.opt.scrolloff = 1000 -- number of screen lines to show around the cursor
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.shortmess = vim.opt.shortmess:append('c')
vim.opt.showfulltag = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.tabstop = 2
vim.opt.undolevels = 10000

vim.opt.termguicolors = true

-- plugin: lualine
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- plugin: nvim-lightbulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- plugin: illuminate
vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
