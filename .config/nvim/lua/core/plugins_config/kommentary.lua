vim.g.kommentary_create_default_mappings = false

require('kommentary.config').configure_language('php', {
  prefer_single_line_comments = true,
})

require('kommentary.config').configure_language('lua', {
  prefer_single_line_comments = true,
})

vim.keymap.set('n', '<leader>cc', '<plug>kommentary_line_default')
vim.keymap.set('n', '<leader>c', '<plug>kommentary_motion_default')
vim.keymap.set('v', '<leader>c', '<plug>kommentary_visual_default')
