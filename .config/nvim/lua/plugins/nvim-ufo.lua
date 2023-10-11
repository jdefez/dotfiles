return {
  'kevinhwang91/nvim-ufo',
  enabled = true,
  dependencies = { 'kevinhwang91/promise-async' },
  opts = {},
  -- opts = {
  --   provider_selector = function(bufnr, filetype, buftype)
  --     return { 'treesitter', 'indent' }
  --   end
  -- },
  keys = {
    { 'zR', require('ufo').openAllFolds, desc = "Open folds" },
    { 'zM', require('ufo').closeAllFolds, desc = "Close folds" },
  }
}
