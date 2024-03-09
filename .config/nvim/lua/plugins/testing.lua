return {
  -- {
  --   "vim-test/vim-test",
  --   keys = {
  --     { "<leader>tn", "<cmd>:TestNearest<cr>", desc = "Run nearest test" },
  --     { "<leader>ta", "<cmd>:TestFile<cr>",    desc = "Run all file tests" },
  --     { "<leader>tl", "<cmd>:TestLast<cr>",    desc = "Run last test" },
  --   }
  -- },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-phpunit",
      -- "theutz/neotest-pest",
    },
    config = function()
      require("neotest").setup({
        -- Summary mappings:
        --  - attach = "a",
        --  - clear_marked = "M",
        --  - clear_target = "T",
        --  - debug = "d",
        --  - debug_marked = "D",
        --  - expand = { "<CR>", "<2-LeftMouse>" },
        --  - expand_all = "e",
        --  - jumpto = "i",
        --  - mark = "m",
        --  - next_failed = "J",
        --  - output = "o",
        --  - prev_failed = "K",
        --  - run = "r",
        --  - run_marked = "R",
        --  - short = "O",
        --  - stop = "u",
        --  - target = "t",
        --  - watch = "w"
        adapters = {
          require("neotest-phpunit"),
          -- require("neotest-pest"),
        },
        diagnostic = {
          enabled = false,
          severity = 1
        },
      })
    end,
    keys = {
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tx",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop nearest test",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run all tests",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle output panel",
      },
    },
  },
}
