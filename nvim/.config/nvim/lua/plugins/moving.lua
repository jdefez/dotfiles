return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      {
        "JMarkin/nvim-tree.lua-float-preview",
        lazy = true,
        -- default
        opts = {
          -- Whether the float preview is enabled by default. When set to false, it has to be "toggled" on.
          toggled_on = true,
          -- wrap nvimtree commands
          wrap_nvimtree_commands = true,
          -- lines for scroll
          scroll_lines = 20,
          -- window config
          window = {
            style = "minimal",
            relative = "win",
            border = "rounded",
            wrap = false,
          },
          mapping = {
            -- scroll down float buffer
            down = { "<C-d>" },
            -- scroll up float buffer
            up = { "<C-e>", "<C-u>" },
            -- enable/disable float windows
            toggle = { "<C-x>" },
          },
          -- hooks if return false preview doesn't shown
          hooks = {
            pre_open = function(path)
              -- if file > 5 MB or not text -> not preview
              local size = require("float-preview.utils").get_size(path)
              if type(size) ~= "number" then
                return false
              end
              local is_text = require("float-preview.utils").is_text(path)
              return size < 5 and is_text
            end,
            post_open = function(bufnr)
              return true
            end,
          },
        },
      },
    },
  },
  -- {
  --   "coffebar/neovim-project",
  --   lazy = false,
  --   opts = {
  --     projects = {
  --       "~/Code/*",
  --       "~/dotfiles/nvim",
  --       "~/dotfiles/kitty",
  --       "~/dotfiles/git",
  --     },
  --   },
  --   dependencies = {
  --     { "Shatur/neovim-session-manager" },
  --   },
  --   keys = {
  --     { "<leader>P", "<cmd>Telescope neovim-project discover<CR>", desc = "Projects list" },
  --   },
  -- },
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
