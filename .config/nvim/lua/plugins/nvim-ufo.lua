return {
  "kevinhwang91/nvim-ufo",
  dependencies = { 'kevinhwang91/promise-async' },
  opts = {},
  keys = {
    {
      'zR',
      function()
        return require('ufo').openAllFolds()
      end,
      desc = "Open folds"
    },
    {
      'zM',
      function()
        return require('ufo').closeAllFolds()
      end,
      desc = "Close folds"
    },
  }
}
