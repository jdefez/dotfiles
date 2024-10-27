return {
  {
    "pocco81/auto-save.nvim",
    lazy = false,
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
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
  {
    "backdround/global-note.nvim",
    config = function()
      require("global-note").setup()
    end,
    keys = {
      {
        mode = { "n" },
        "<leader>N",
        function()
          require("global-note").toggle_note()
        end,
        desc = "Toggle global note",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    lazy = false,
    opts = {},
  },
}
