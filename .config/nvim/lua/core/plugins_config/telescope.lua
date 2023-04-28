require('telescope').setup({
  defaults = {
    borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
    layout_strategy = 'vertical',
    layout_config = { height = 0.95 },
    -- layout_config = {
    --   vertical = { width = 0.7 }
    -- },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    lsp_references = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown"
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown"
    }
  },
})
-- require('telescope').load_extension('dap')

vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fc', ':Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fG', ':Telescope grep_string<CR>')
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')

-- dap extension

-- vim.keymap.set('n', '<leader>fdc', ':Telescope dap commands<CR>')
-- vim.keymap.set('n',('<leader>fdC', ':Telescope dap configurations<CR>')
-- vim.keymap.set('n',('<leader>fdb', ':Telescope dap list_breakpoints<CR>')
-- vim.keymap.set('n',('<leader>fdv', ':Telescope dap variables<CR>')
-- vim.keymap.set('n',('<leader>fdv', ':Telescope dap frames<CR>')
