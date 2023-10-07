return { 
  'mrjones2014/smart-splits.nvim',
  opts = {},
  keys = {
    -- resizing splits
    {'<A-h>', require('smart-splits').resize_left, desc = 'Split resize left' },
    {'<A-j>', require('smart-splits').resize_down, desc = 'Split resize down' },
    {'<A-k>', require('smart-splits').resize_up, desc = 'Split resize up' },
    {'<A-l>', require('smart-splits').resize_right, desc = 'Split resize right' },
    -- moving between splits
    { '<C-h>', require('smart-splits').move_cursor_left, desc = 'Split jump left' },
    { '<C-j>', require('smart-splits').move_cursor_down, desc = 'Split jump down' },
    { '<C-k>', require('smart-splits').move_cursor_up, desc = 'Split jump up' },
    { '<C-l>', require('smart-splits').move_cursor_right, desc = 'Split jump right' },
  }
}
