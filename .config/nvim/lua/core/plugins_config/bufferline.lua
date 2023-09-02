require('bufferline').setup({
  options = {
    themable = true,
    -- mode = 'buffers',
    -- separator_style = 'slope',
    show_tab_indicators = true,
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    -- custom_areas = {
    --   right = require("visual_studio_code").get_bufferline_right(),
    -- },
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
