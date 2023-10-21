return {
  "b3nj5m1n/kommentary",
  init = function()
    vim.g.kommentary_create_default_mappings = false

    require('kommentary.config').configure_language('php', {
      prefer_single_line_comments = true,
    })

    require('kommentary.config').configure_language('lua', {
      prefer_single_line_comments = true,
    })
  end,
  keys = {
    { '<leader>cc', '<plug>kommentary_line_default', desc = 'Comment line' },
    { '<leader>c', '<plug>kommentary_motion_default', desc = '' },
    { mode = 'v', '<leader>c', '<plug>kommentary_visual_default', desc = '' },
  }
}
