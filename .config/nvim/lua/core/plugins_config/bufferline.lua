require('bufferline').setup({
  options = {
    separator_style = 'slant'
  }
})

vim.keymap.set('n', 'bL', ':BufferLineMoveNext<CR>', { silent = true })
vim.keymap.set('n', 'bH', ':BufferLineMovePrev<CR>', { silent = true })
vim.keymap.set('n', 'bl', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', 'bh', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', 'bp', ':BufferLinePick<CR>', { silent = true })
vim.keymap.set('n', 'bP', ':BufferLineTogglePin<CR>', { silent = true })
vim.keymap.set('n', 'bs', ':BufferLineSortByDirectory<CR>', { silent = true })
vim.keymap.set('n', 'bcl', ':BufferLineCloseRight<CR>', { silent = true })
vim.keymap.set('n', 'bcr', ':BufferLineCloseLeft<CR>', { silent = true })
