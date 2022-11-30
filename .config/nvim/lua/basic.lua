vim.g.mapleader = ' '
vim.g['termguicolors'] = true

-- Fern
vim.g.fern = 'disable_default_mappings'
vim.g["fern#renderer"] = 'nvim-web-devicons'

vim.g['python3_host_prog'] = '/usr/bin/python3'

vim.g['phpactorCompletionIgnoreCase'] = true

-- murmur

FOO = 'your_augroup_name'
vim.api.nvim_create_augroup(FOO, { clear = true })

vim.api.nvim_create_autocmd('CursorHold', {
  group = FOO,
  pattern = '*',
  callback = function()
    -- skip when a float-win already exists.
    if vim.w.diag_shown then return end

    -- open float-win when hovering on a cursor-word.
    if vim.w.cursor_word ~= '' then
      vim.diagnostic.open_float(nil, {
        focusable = true,
        close_events = { 'InsertEnter' },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      })
      vim.w.diag_shown = true
    end
  end
})

-- plugin: vim-test

vim.g['test#php#phpunit#executable'] = './vendor/bin/phpunit'
vim.g['test#echo_command'] = false
vim.g['test#strategy'] = 'vimux'
vim.g['test#php#phpunit#options'] = '--testdox'

-- plugin: lualine

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- plugin: nvim-lightbulb

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- plugin: illuminate

-- vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
-- vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
-- vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]

-- plugin: gina

vim.opt.diffopt = 'vertical'

-- plugin: coq

vim.g.coq_settings = {
  ['auto_start'] = true,
  ['keymap.jump_to_mark'] = '<tab>',
  ['keymap.eval_snips'] = '<leader>e',
}

-- basics

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
