return {
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
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
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        NOTE = {
          icon = " ",
          color = "hint",
          alt = { "INFO", "EXPECT" },
        },
      },
    },
  },
  {
    "xiyaowong/virtcolumn.nvim",
    lazy = false,
    highlight = { "VirtColumn" },
    config = function()
      vim.api.nvim_set_hl(0, "VirtColumn", { fg = "orange" })
    end,
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    lazy = false,
    keys = {
      -- NOTE: Deleting cursors
      {
        mode = { "n", "v" },
        "<c-x>",
        function()
          require("multicursor-nvim").deleteCursor()
        end,
        desc = "Delete cursor",
      },
      {
        mode = { "n" },
        "<M-x>",
        function()
          require("multicursor-nvim").clearCursors()
        end,
        desc = "Clear all cursors",
      },
      -- NOTE: Rotate the main cursor.
      {
        mode = { "n", "v" },
        "<left>",
        function()
          require("multicursor-nvim").nextCursor()
        end,
        desc = "Rotate next cursor",
      },
      -- {
      --   mode = { "n", "v" },
      --   "<right>",
      --   function()
      --     require("multicursor-nvim").prevCursor()
      --   end,
      --   desc = "Rotate previous cursor",
      -- },
      -- NOTE: Add a new cursor by matching word/selection
      {
        mode = { "n", "v" },
        "<M-w>",
        function()
          require("multicursor-nvim").matchAddCursor(1)
        end,
        desc = "Add cursor",
      },
      -- {
      --   mode = { "n", "v" },
      --   "<c-a>",
      --   function()
      --     require("multicursor-nvim").matchAddCursor(-1)
      --   end,
      --   desc = "Add cursor above",
      -- },
      -- {
      --   mode = { "n", "v" },
      --   "<up>",
      --   function()
      --     require("multicursor-nvim").lineAddCursor(-1)
      --   end,
      --   desc = "Add cursor above",
      -- },
      -- {
      --   mode = { "n", "v" },
      --   "<down>",
      --   function()
      --     require("multicursor-nvim").lineAddCursor(1)
      --   end,
      --   desc = "Add cursor below",
      -- },
      -- NOTE: Skip adding a new cursor by matching word/selection
      {
        mode = { "n", "v" },
        "<M-s>",
        function()
          require("multicursor-nvim").matchSkipCursor(1)
        end,
        desc = "Skip cursor",
      },
      -- {
      --   mode = { "n", "v" },
      --   "<leader>S",
      --   function()
      --     require("multicursor-nvim").matchSkipCursor(-1)
      --   end,
      --   desc = "Skip cursor above",
      -- },
      -- {
      --   mode = { "n", "v" },
      --   "<leader><up>",
      --   function()
      --     require("multicursor-nvim").lineSkipCursor(-1)
      --   end,
      --   desc = "Skip cursor above",
      -- },
      -- {
      --   mode = { "n", "v" },
      --   "<leader><down>",
      --   function()
      --     require("multicursor-nvim").lineSkipCursor(1)
      --   end,
      --   desc = "Skip cursor below",
      -- },
    },
    config = function()
      local mc = require "multicursor-nvim"
      mc.setup()

      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
