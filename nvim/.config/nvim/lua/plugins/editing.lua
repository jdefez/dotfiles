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
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    lazy = false,
    keys = {
      -- Add or skip cursor above/below the main cursor.
      {
        mode = { "n", "v" },
        "<up>",
        function()
          require("multicursor-nvim").lineAddCursor(-1)
        end,
        desc = "Add cursor above",
      },
      {
        mode = { "n", "v" },
        "<down>",
        function()
          require("multicursor-nvim").lineAddCursor(1)
        end,
        desc = "Add cursor below",
      },
      {
        mode = { "n", "v" },
        "<leader><up>",
        function()
          require("multicursor-nvim").lineSkipCursor(-1)
        end,
        desc = "Skip cursor above",
      },
      {
        mode = { "n", "v" },
        "<leader><down>",
        function()
          require("multicursor-nvim").lineSkipCursor(1)
        end,
        desc = "Skip cursor below",
      },
      -- Add or skip adding a new cursor by matching word/selection
      {
        mode = { "n", "v" },
        "<leader>a",
        function()
          require("multicursor-nvim").matchAddCursor(1)
        end,
        desc = "Add cursor by matching word/selection",
      },
      {
        mode = { "n", "v" },
        "<leader>s",
        function()
          require("multicursor-nvim").matchSkipCursor(1)
        end,
        desc = "Skip cursor by matching word/selection",
      },
      {
        mode = { "n", "v" },
        "<leader>A",
        function()
          require("multicursor-nvim").matchAddCursor(-1)
        end,
        desc = "Add cursor by matching word/selection",
      },
      {
        mode = { "n", "v" },
        "<leader>S",
        function()
          require("multicursor-nvim").matchSkipCursor(-1)
        end,
        desc = "Skip cursor by matching word/selection",
      },
      -- Rotate the main cursor.
      {
        mode = { "n", "v" },
        "<left>",
        function()
          require("multicursor-nvim").nextCursor()
        end,
        desc = "Rotate cursor left",
      },
      {
        mode = { "n", "v" },
        "<right>",
        function()
          require("multicursor-nvim").prevCursor()
        end,
        desc = "Rotate cursor right",
      },
      -- Delete the main cursor.
      -- {
      --   mode = { "n", "v" },
      --   conflicting with buffer delete
      --   "<leader>x",
      --   function()
      --     require("multicursor-nvim").deleteCursor()
      --   end,
      --   desc = "Delete cursor",
      -- },
      -- Add and remove cursors with control + left click.
      {
        "n",
        "<c-leftmouse>",
        function()
          require("multicursor-nvim").handleMouse()
        end,
        desc = "Add or remove cursor with control + left click",
      },
      -- Easy way to add and remove cursors using the main cursor.
      {
        mode = { "n", "v" },
        "<c-q>",
        function()
          require("multicursor-nvim").toggleCursor()
        end,
        desc = "Toggle cursor",
      },
      -- Clone every cursor and disable the originals.
      -- {
      --   mode = { "n", "v" },
      --   "<leader><c-q>",
      --   function()
      --     require("multicursor-nvim").duplicateCursors()
      --   end,
      --   desc = "Duplicate cursor",
      -- },
      {
        "n",
        "<esc>",
        function()
          require("multicursor-nvim").clearCursors()
          -- local mc = require "multicursor-nvim"
          -- if not mc.cursorsEnabled() then
          --   mc.enableCursors()
          -- elseif mc.hasCursors() then
          --   mc.clearCursors()
          -- else
          --   -- Default <esc> handler.
          -- end
        end,
        desc = "Clear cursors",
      },
      -- bring back cursors if you accidentally clear them
      {
        "n",
        "<leader>gv",
        function()
          require("multicursor-nvim").restoreCursors()
        end,
        desc = "Restore cursors",
      },
      -- Align cursor columns.
      {
        "n",
        "<leader>a",
        function()
          require("multicursor-nvim").alignCursors()
        end,
        desc = "Align cursor columns",
      },
      -- Split visual selections by regex.
      -- {
      --   "v",
      --   "S",
      --   function()
      --     require("multicursor-nvim").splitCursors()
      --   end,
      --   desc = "Split visual selections by regex",
      -- },
      -- Append/insert for each line of visual selections.
      {
        "v",
        "I",
        function()
          require("multicursor-nvim").insertVisual()
        end,
        desc = "Insert for each line of visual selections",
      },
      {
        "v",
        "A",
        function()
          require("multicursor-nvim").appendVisual()
        end,
        desc = "Append for each line of visual selections",
      },
      -- match new cursors within visual selections by regex.
      -- {
      --   "v",
      --   "M",
      --   function()
      --     require("multicursor-nvim").matchCursors()
      --   end,
      --   desc = "Match new cursors within visual selections by regex",
      -- },
      -- Rotate visual selection contents.
      -- {
      --   "v",
      --   "<leader>t",
      --   function()
      --     require("multicursor-nvim").transposeCursors(1)
      --   end,
      --   desc = "Rotate visual selection contents",
      -- },
      -- {
      --   "v",
      --   "<leader>T",
      --   function()
      --     require("multicursor-nvim").transposeCursors(-1)
      --   end,
      --   desc = "Rotate visual selection contents",
      -- },
      -- Jumplist support
      -- set({ "v", "n" }, "<c-i>", mc.jumpForward)
      -- set({ "v", "n" }, "<c-o>", mc.jumpBackward)
    },
    config = function()
      require("multicursor-nvim").setup()

      local hl = vim.api.nvim_set_hl

      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
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
    highlight = { "VirtColumn" },
    config = function()
      vim.api.nvim_set_hl(0, "VirtColumn", { fg = "red" })
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
      },
      options = {
        -- signcolumn = "no", -- disable signcolumn
        -- number = false, -- disable number column
        -- relativenumber = false, -- disable relative numbers
        -- cursorline = false, -- disable cursorline
        -- cursorcolumn = false, -- disable cursor column
        -- foldcolumn = "0", -- disable fold column
        -- list = false, -- disable whitespace characters
      },
    },
    keys = {
      {
        "<Leader>z",
        "<Cmd>ZenMode<CR>",
        mode = { "n", "v" },
        desc = "Zen mode",
      },
    },
  },
}
