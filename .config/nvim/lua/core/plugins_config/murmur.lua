local FOO = 'your_augroup_name'
vim.api.nvim_create_augroup(FOO, { clear = true })

require('murmur').setup({
  -- cursor_rgb = {
  --   guibg = 'white',
  --   guifg = 'orange',
  -- },
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
})

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  group = FOO,
  pattern = 'solarized',
  callback = function()
    vim.api.nvim_set_hl(0, "murmur_cursor_rgb", { bg = "none", fg = "orange" })
  end
})
