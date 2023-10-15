return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "kevinhwang91/nvim-ufo" },
  build = ":TSUpdate",
  opts = {},
  init = function ()
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
      end
    })
  end
}
