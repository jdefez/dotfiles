---@diagnostic disable: undefined-global
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
nnoremap('<leader>ba', ':%bd<CR>', 'Delete all buffers')
nnoremap('<leader>bc', ':BDelete this<CR>', 'Delete current buffer')
nnoremap('<leader>bh', ':BDelete hidden<CR>', 'Delete hidden buffers')
nnoremap('<leader>bn', ':BDelete nameless<CR>', 'Delete nameless buffers')

-- bufferline

nnoremap('[b', ':BufferLineMoveNext<CR>', 'Next buffer')
nnoremap('b]', ':BufferLineMovePrev<CR>', 'Previous buffer')
nnoremap('bn', ':BufferLineCycleNext<CR>', 'Cycle next buffer')
nnoremap('bp', ':BufferLineCyclePrev<CR>', 'Cycle previous buffer')
nnoremap('bP', ':BufferLinePick<CR>', 'Pick buffer')

-- Fern
nnoremap('<leader>n', ':Fern -drawer -toggle .<CR>', 'Toggle Fern drawer')

-- dap

m.nname('da', 'Dap')
nnoremap('daS', ':lua require"dap".continue()<CR>', 'Dap Continue')
nnoremap('das', ':lua local widgets=require("dap.ui.widgets");widgets.centered_float(widgets.scopes)<CR>', 'dap scopes')
nnoremap('dal', ':lua require"dap".step_over()<CR>', 'Dap Step over')
nnoremap('daj', ':lua require"dap".step_into()<CR>', 'Dap Step in')
nnoremap('dak', ':lua require"dap".step_out()<CR>', 'Dap Step out')

nnoremap('dab', ':lua require"dap".toggle_breakpoint()<CR>', 'Dap Toggle breakpoint')
nnoremap('dac', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', 'Dap Set breakpoint condition')
nnoremap('daC', ':lua require"dap".clear_breakpoints()<CR>', 'Dap clear breakpoints')
nnoremap('daL', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', 'Dap Set breakpoint log message')

nnoremap('dar', ':lua require"dap".repl.open({}, "vsplit")<CR>', 'dap repl open')
nnoremap('daw', ':lua require"dap.ui.widgets".hover()<CR>', 'dap widgets hover')
nnoremap('daW', ":lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", 'dap widgets hover float')

-- telescope dap extension

m.nname('<leader>fd', 'Dap')
nnoremap('<leader>fdc', ':Telescope dap commands<CR>', 'List Dap commands')
nnoremap('<leader>fdC', ':Telescope dap configurations<CR>', 'List Dap configurations')
nnoremap('<leader>fdb', ':Telescope dap list_breakpoints<CR>', 'List breakpoints')
nnoremap('<leader>fdv', ':Telescope dap variables<CR>', 'Dap variables')
nnoremap('<leader>fdf', ':Telescope dap frames<CR>', 'Dap frames')

-- fugitive

m.nname('<leader>g', ':Gvdiffsplit!<CR>', 'Fugitive')
nnoremap('<leader>gd', ':Gvdiffsplit!<CR>', 'Fugitive open diffview')
nnoremap('dgh', ':diffget //2<CR>', 'Fugitive get local')
nnoremap('dgl', ':diffget //3<CR>', 'Fugitive get remote')

-- kommentary

m.nname('<leader>c', 'Comment')
nnoremap('<leader>cc', '<plug>kommentary_line_default', 'comment line')
vnoremap('<leader>c', '<plug>kommentary_visual_default', 'comment visual/motion')

-- hunks

m.nname('<leader>h', 'Hunks')
nnoremap('<leader>hs', ':Gitsigns stage_hunk<CR>', 'Stage hunk')
nnoremap('<leader>hu', ':Gitsigns undo_stage_hunk<CR>', 'Undo stage hunk')
nnoremap('<leader>hU', ':Gitsigns reset_buffer_index<CR>', 'Reset buffer index')
nnoremap('<leader>hr', ':Gitsigns reset_hunk<CR>', 'Reset hunk')
nnoremap('<leader>hR', ':Gitsigns reset_buffer<CR>', 'Reset buffer')
nnoremap('<leader>hS', ':Gitsigns stage_buffer<CR>', 'Stage buffer')
nnoremap('<leader>hp', ':Gitsigns preview_hunk<CR>', 'Preview hunk')

-- telescope

m.nname('<leader>f', 'Files')
nnoremap('<leader>fa', ':Telescope lsp_code_actions<CR>', 'Lsp code actions')
vnoremap('<leader>fA', ':Telescope lsp_range_code_actions<CR>', 'Lsp range code actions')
nnoremap('<leader>fb', ':Telescope buffers<CR>', 'List Buffers')
nnoremap('<leader>fc', ':Telescope git_commits<CR>', 'List commits')
nnoremap('<leader>fD', ':Telescope diagnostics<CR>', 'List diagnostics')
nnoremap('<leader>fh', ':Telescope help_tags<CR>', 'Help tags')
nnoremap('<leader>ff', ':Telescope find_files<CR>', 'Find file')
nnoremap('<leader>fg', ':Telescope live_grep<CR>', 'Live grep')
nnoremap('<leader>fG', ':Telescope grep_string<CR>', 'Grep string')
nnoremap('<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>', 'Find in file')
nnoremap('<leader>fs', ':Telescope git_status<CR>', 'Show git status')
nnoremap('<leader>fS', ':Telescope lsp_document_symbols<CR>', 'Document symbols in the current buffer')
-- nnoremap('<leader>fr', ':Telescope lsp_references<CR>', 'Word undercursore lsp references')


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

