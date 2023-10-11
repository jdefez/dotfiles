return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  opts = {},
  init = function ()
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
      end
    })
  end
}
