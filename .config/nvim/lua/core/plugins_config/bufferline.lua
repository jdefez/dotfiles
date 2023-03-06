require('bufferline').setup({
    options = {
        separator_style = 'slant'
    }
})

vim.keymap.set('n', 'bL', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', 'bH', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', 'bl', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', 'bh', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', 'bp', ':BufferLinePick<CR>')
vim.keymap.set('n', 'bP', ':BufferLineTogglePin<CR>')
vim.keymap.set('n', 'bs', ':BufferLineSortByDirectory<CR>')
vim.keymap.set('n', 'bcl', ':BufferLineCloseLeft<CR>')
vim.keymap.set('n', 'bcr', ':BufferLineCloseRight<CR>')
