return {
  "nyngwang/murmur.lua",
  opts = {
    cursor_rgb = {
      guibg = nil,
      guifg = '#B17855',
    },
    -- cursor_rgb_always_use_config = true,
    max_len = 80,
    min_len = 3,
    exclude_filetypes = {},
    callbacks = {
      -- to trigger the close_events of vim.diagnostic.open_float.
      function()
        -- Close floating diag. and make it triggerable again.
        vim.cmd('doautocmd InsertEnter')
        vim.w.diag_shown = false
      end,
    }
  }
}
