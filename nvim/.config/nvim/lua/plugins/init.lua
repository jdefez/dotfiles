return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- {
  --   "meznaric/key-analyzer.nvim",
  --   event = "BufRead",
  --   opts = {},
  -- },
}
