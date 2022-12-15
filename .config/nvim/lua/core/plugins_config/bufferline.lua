require('bufferline').setup({})

vim.keymap.set('n', '[b', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', 'b]', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', 'bn', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', 'bp', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', 'bP', ':BufferLinePick<CR>')
