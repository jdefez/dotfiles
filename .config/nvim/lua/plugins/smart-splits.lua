return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  opts = {},
  enabled = true,
  keys = {
    -- resizing splits
    {
      "<A-h>",
      function()
        return require("smart-splits").resize_left()
      end,
      desc = "Split resize left",
    },
    {
      "<A-j>",
      function()
        return require("smart-splits").resize_down()
      end,
      desc = "Split resize down",
    },
    {
      "<A-k>",
      function()
        return require("smart-splits").resize_up()
      end,
      desc = "Split resize up",
    },
    {
      "<A-l>",
      function()
        return require("smart-splits").resize_right()
      end,
      desc = "Split resize right",
    },
    -- moving between splits
    {
      "<C-h>",
      function()
        return require("smart-splits").move_cursor_left()
      end,
      desc = "Split jump left",
    },
    {
      "<C-j>",
      function()
        return require("smart-splits").move_cursor_down()
      end,
      desc = "Split jump down",
    },
    {
      "<C-k>",
      function()
        return require("smart-splits").move_cursor_up()
      end,
      desc = "Split jump up",
    },
    {
      "<C-l>",
      function()
        return require("smart-splits").move_cursor_right()
      end,
      desc = "Split jump right",
    },
  },
}
