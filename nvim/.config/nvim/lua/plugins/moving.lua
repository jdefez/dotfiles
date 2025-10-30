return {
  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      require("nvim-tree").setup {
        prefer_startup_root = true,
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      }
    end,
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
            up = { "<C-u>" },
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
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash" 
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search"
      }
    },
  },
}
