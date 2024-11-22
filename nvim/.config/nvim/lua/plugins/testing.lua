return {
  {
    "nvim-neotest/neotest",
    ft = { "php" },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-pest" {
            ignore_dirs = { "vendor", "node_modules" },
          },
        },
      }
    end,
    keys = {
      {
        mode = { "n" },
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest tests",
      },
      {
        mode = { "n" },
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run test file",
      },
      {
        mode = { "n" },
        "<leader>ts",
        function()
          require("neotest").run.run { suite = true }
        end,
        desc = "Run test suite",
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      -- "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "V13Axel/neotest-pest",
    },
  },
}
