return {
  { "pocco81/auto-save.nvim", lazy = false },
  {
    "karb94/neoscroll.nvim",
    lazy = true,
    opts = {},
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {},
    keys = {
      {
        "zR",
        function()
          return require("ufo").openAllFolds()
        end,
        desc = "Open folds",
      },
      {
        "zM",
        function()
          return require("ufo").closeAllFolds()
        end,
        desc = "Close folds",
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {
      theme = {
        normal = { fg = "#999999" },
      },
    },
  },
}
