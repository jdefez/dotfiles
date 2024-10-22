return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          commonlisp = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
        blacklist = { "c", "cpp" },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "EXPECT" } },
      },
    },
  },
  {
    "xiyaowong/virtcolumn.nvim",
    lazy = false,
  },
}
