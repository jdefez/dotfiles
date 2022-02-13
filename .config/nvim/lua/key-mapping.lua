local m = require('mapx').setup({ global = true, whichkey = true })

-- fix copy line
nnoremap('Y', 'yy$')

-- custom escape

inoremap('jj', '<ESC>')

-- moving lines

nnoremap('<S-Up>', ':m .-2<CR>==')
nnoremap('<S-Down>', ':m .+1<CR>==')
vnoremap('<S-Up>', ":m '<-2<CR>gv=gv")
vnoremap('<S-Down>', ":m '>+1<CR>gv=gv")

-- buffers

m.nname('<leader>b', 'Buffers')
nnoremap('<leader>bc', ':BDelete this<CR>', 'Delete current buffer')
nnoremap('<leader>bh', ':BDelete hidden<CR>', 'Delete hidden buffers')
nnoremap('<leader>bn', ':BDelete nameless<CR>', 'Delete nameless buffers')

-- dap

m.nname('<leader>D', 'Diagnostics')
nnoremap('<leader>Ds', ':lua require"dap".continue()<CR>', 'Dap Continue')
nnoremap('<C-Right>', ':lua require"dap".step_over()<CR>', 'Dap Step over')
nnoremap('<C-Down>', ':lua require"dap".step_into()<CR>', 'Dap Step in')
nnoremap('<C-Left>', ':lua require"dap".step_out()<CR>', 'Dap Step out')
nnoremap(
  '<leader>Db',
  ':lua require"dap".toggle_breakpoint()<CR>',
  'Dap Toggle breakpoint'
)
nnoremap(
  '<leader>Dt',
  ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
  'Dap Set breakpoint condition'
)
nnoremap(
  '<leader>Dl',
  ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
  'Dap Set breakpoint log message'
)
nnoremap('<leader>Drl', ':lua require"dap".run_last()<CR>', 'Dap run last')
nnoremap('<leader>Dr', ':lua require"dap".repl.open({}, "vsplit")<CR>', 'Dap open REPL')

-- diagnostics

m.nname('<leader>d', 'Diagnostics')
nnoremap('<leader>dt', ':TroubleToggle<CR>', 'Toggle diagnostics')
nnoremap('<leader>dw', ':TroubleToggle workspace_diagnostics<CR>', 'Toggle workspace diagnostics')
nnoremap('<leader>dd', ':TroubleToggle document_diagnostics<CR>', 'Toggle document diagnostics')
nnoremap('<leader>dq', ':TroubleToggle quickfix<CR>', 'Toggle quickfix')
nnoremap('<leader>dl', ':TroubleToggle loclist<CR>', 'Toggle loclist')
nnoremap('<leader>dR', ':TroubleToggle lsp_references<CR>', 'Toggle lsp references')

-- Telescope

m.nname('<leader>f', 'Files')
nnoremap('<leader>ff', ':Telescope find_files<CR>', 'Find file')
nnoremap('<leader>fg', ':Telescope live_grep<CR>', 'Live grep')
nnoremap('<leader>fG', ':Telescope grep_string<CR>', 'Grep string')
nnoremap('<leader>fb', ':Telescope buffers<CR>', 'List Buffers')
nnoremap('<leader>fh', ':Telescope help_tags<CR>', 'Help tags')
nnoremap('<leader>fc', ':Telescope git_commits<CR>', 'List commits')
nnoremap('<leader>fs', ':Telescope git_status<CR>', 'Show git status')

-- telescope dap extension

m.nname('<leader>fd', 'Dap')
nnoremap('<leader>fdc', ':Telescope dap commands<CR>', 'List Dap commands')
nnoremap('<leader>fdC', ':Telescope dap configurations<CR>', 'List Dap configurations')
nnoremap('<leader>fdb', ':Telescope dap list_breakpoints<CR>', 'List breakpoints')
nnoremap('<leader>fdv', ':Telescope dap variables<CR>', 'Dap variables')
nnoremap('<leader>fdf', ':Telescope dap frames<CR>', 'Dap frames')

-- hunks

m.nname('<leader>h', 'Hunks')
nnoremap('<leader>hs', ':Gitsigns stage_hunk<CR>', 'Stage hunk')
nnoremap('<leader>hu', ':Gitsigns undo_stage_hunk<CR>', 'Undo stage hunk')
nnoremap('<leader>hU', ':Gitsigns reset_buffer_index<CR>', 'Reset buffer index')
nnoremap('<leader>hr', ':Gitsigns reset_hunk<CR>', 'Reset hunk')
nnoremap('<leader>hR', ':Gitsigns reset_buffer<CR>', 'Reset buffer')
nnoremap('<leader>hS', ':Gitsigns stage_buffer<CR>', 'Stage buffer')
nnoremap('<leader>hp', ':Gitsigns preview_hunk<CR>', 'Preview hunk')

-- kommentary

m.nname('<leader>c', 'Comment')
nnoremap('<leader>cc', '<plug>kommentary_line_default', 'comment line')
nnoremap('<leader>c', '<plug>kommentary_motion_default', 'comment visual/motion')
vnoremap('<leader>c', '<plug>kommentary_visual_default', 'comment visual/motion')

-- php

m.nname('<leader>p', 'Php')
nnoremap('<leader>pp', ':PhpactorContextMenu<CR>', 'Show phpactor context menu')
nnoremap('<leader>pt', ':PhpactorTransform<CR>', 'Show phpactor transform menu')
vnoremap('<leader>pm', ':<C-U>PhpactorExtractMethod<CR>', 'Phpactor extract method')
vnoremap('<leader>pe', ':<C-U>PhpactorExtractExpression<CR>', 'Phpactor extract expression')

-- test runner

m.nname('<leader>t', 'Test runner')
nnoremap('<leader>tn', ':TestNearest<CR>', 'Run nearest test')
nnoremap('<leader>tT', ':TestFile<CR>', 'Run test file')
nnoremap('<leader>ta', ':TestSuite<CR>', 'Run test suite')
nnoremap('<leader>tl', ':TestLast<CR>', 'Run latest test')
nnoremap('<leader>tv', ':TestVisit<CR>', 'Visit test')

-- zen mode
nnoremap('<leader>z', ':ZenMode<CR>', 'Toggle zen mode')

