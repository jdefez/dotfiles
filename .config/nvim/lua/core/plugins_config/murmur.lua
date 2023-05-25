FOO = 'your_augroup_name'
vim.api.nvim_create_augroup(FOO, { clear = true })

require('murmur').setup({
  cursor_rgb = {
    -- guibg = 'black',
    guifg = 'orange',
  },
  cursor_rgb_always_use_config = true, -- if set to `true`, then always use `cursor_rgb`.
  max_len = 80,
  min_len = 3, -- this is recommended since I prefer no cursorword highlighting on `if`.
  exclude_filetypes = {},
  callbacks = {
    -- to trigger the close_events of vim.diagnostic.open_float.
    function()
      -- Close floating diag. and make it triggerable again.
      vim.cmd('doautocmd InsertEnter')
      vim.w.diag_shown = false
    end,
  }
})
