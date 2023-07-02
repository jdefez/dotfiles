require('flash').setup({
  label = {
    rainbow = {
      enable = true,
    }
  },
  highlight = {
    backdrop = true,
  },
})

vim.keymap.set('', 's', function()
  require("flash").jump({ highlight = { matches = true } })
end, { silent = true })

-- treesitter

vim.keymap.set('', 'S', function()
  require("flash").treesitter()
end, { silent = true })

vim.keymap.set('', 'R', function()
  require("flash").treesitter_search()
end, { silent = true })

-- overriding flash highlight group: FlashLabel

local function mod_hl(hl_name, opts)
  local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
  if is_ok then
    for k, v in pairs(opts) do hl_def[k] = v end
    vim.api.nvim_set_hl(0, hl_name, hl_def)
  end
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = vim.api.nvim_create_augroup('Color', {}),
  pattern = "*",
  callback = function()
    mod_hl("FlashLabel", { fg = '#ffffff' })
  end
})
