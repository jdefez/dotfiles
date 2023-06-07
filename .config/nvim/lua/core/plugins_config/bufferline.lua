require('bufferline').setup({
  options = {
    separator_style = 'slant'
  }
})

vim.keymap.set('n', 'bL', ':BufferLineMoveNext<CR>', { slient = true })
vim.keymap.set('n', 'bH', ':BufferLineMovePrev<CR>', { slient = true })
vim.keymap.set('n', 'bl', ':BufferLineCycleNext<CR>', { slient = true })
vim.keymap.set('n', 'bh', ':BufferLineCyclePrev<CR>', { slient = true })
vim.keymap.set('n', 'bp', ':BufferLinePick<CR>', { slient = true })
vim.keymap.set('n', 'bP', ':BufferLineTogglePin<CR>', { slient = true })
vim.keymap.set('n', 'bs', ':BufferLineSortByDirectory<CR>', { slient = true })
vim.keymap.set('n', 'bcr', ':BufferLineCloseLeft<CR>', { slient = true })
vim.keymap.set('n', 'bcl', ':BufferLineCloseRight<CR>', { slient = true })
