return {
  {
    "coffebar/neovim-project",
    lazy = false,
    -- priority = 100,
    opts = {
      projects = {
        "~/Code/*",
        "~/.config/nvim",
        "~/.config/kitty",
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
      vim.opt.sessionoptions:append "globals"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    keys = {
      { "<leader>P", "<cmd>Telescope neovim-project discover<CR>", desc = "Projects list" },
    },
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    opts = {
      keys = {
        {
          mode = { "n" },
          "<leader>q",
          function()
            require("quicker").toggle()
          end,
          desc = "Close quickfix",
          silent = true,
        },
        {
          ">",
          function()
            require("quicker").expand { before = 2, after = 2, add_to_existing = true }
          end,
          desc = "Expand quickfix context",
          silent = true,
        },
        {
          "<",
          function()
            require("quicker").collapse()
          end,
          desc = "Collapse quickfix context",
          silent = true,
        },
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        rainbow = {
          enable = true,
        },
      },
      highlight = {
        backdrop = true,
      },
    },
    -- stylua: ignore
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash"
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter"
      },
    },
  },
}
