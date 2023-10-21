return {
  'NeogitOrg/neogit',
  -- lazy = false,
  opts = {},
  dependencies = {
    -- "sindrets/diffview.nvim",
    "nvim-lua/plenary.nvim"
  },
  keys = {
    {'<leader>G', '<cmd>Neogit kind=vsplit<CR>', desc = 'Neogit open'},
  }
}
