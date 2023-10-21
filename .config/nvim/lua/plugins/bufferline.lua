return {
  "akinsho/bufferline.nvim",
  lazy = false,
  -- tag = "v3.*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      themable = true,
      -- separator_style = 'slant'
    }
  },
  keys = {
    { 'bL', '<cmd>:BufferLineMoveNext<CR>', desc = 'Move buffer right' },
    { 'bH', '<cmd>:BufferLineMovePrev<CR>', desc = 'Move buffer left' },
    { 'bl', '<cmd>:BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { 'bh', '<cmd>:BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
    { 'bp', '<cmd>:BufferLinePick<CR>', desc = 'Pick buffer' },
    { 'bP', '<cmd>:BufferLineTogglePin<CR>', desc = 'Pin/Unpin buffer' },
    { 'bs', '<cmd>:BufferLineSortByDirectory<CR>', desc = 'Sort buffer by directory' },
    { 'bcr', '<cmd>:BufferLineCloseLeft<CR>', desc = 'Close left buffers' },
    { 'bcl', '<cmd>:BufferLineCloseRight<CR>', desc = 'Next right buffers' },
  }
}
