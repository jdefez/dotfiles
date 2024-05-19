return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        indent = {
          enable = true,
        },
        -- A list of parser names, or "all"
        ensure_installed = {
          "markdown_inline",
          "markdown",
          "graphql",
          "phpdoc",
          "python",
          "regex",
          "json",
          "html",
          "yaml",
          "vue",
          "css",
          "lua",
          "php",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        -- List of parsers to ignore installing (for "all")
        highlight = {
          additional_vim_regex_highlighting = false,
        },
        ignore_install = {},
      })
    end,
    dependencies = {
      -- "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      -- "nvim-treesitter/nvim-treesitter-hl"
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["am"] = { query = "@function.outer", desc = "Select outter function" },
              ["ac"] = { query = "@class.outer", desc = "Select outter class" },
              ["im"] = { query = "@function.inner", desc = "Select inner function" },
              ["ic"] = { query = "@class.inner", desc = "Select inner class" },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]ms"] = { query = "@function.outer", desc = "Goto next function start" },
              ["]cs"] = { query = "@class.outer", desc = "Goto next class start" },
            },
            goto_next_end = {
              ["]me"] = { query = "@function.outer", desc = "Goto next function end" },
              ["]ce"] = { query = "@class.outer", desc = "Goto next class end" },
            },
            goto_previous_start = {
              ["[ms"] = { query = "@function.outer", desc = "Goto previous function start" },
              ["[cs"] = { query = "@class.outer", desc = "Goto previous class start" },
            },
            goto_previous_end = {
              ["[me"] = { query = "@function.outer", desc = "Goto previous function end" },
              ["[ce"] = { query = "@class.outer", desc = "Goto previous class end" },
            },
          },
          -- swap = {
          --   enable = true,
          --   swap_next = {
          --     ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
          --   },
          --   swap_previous = {
          --     ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
          --   },
          -- },
        },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    config = function()
      require("nvim-treesitter.configs").setup({
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = true },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },
          -- navigation = {
          --   enable = true,
          --   keymaps = {
          --     goto_definition = "gnd",
          --     list_definitions = "gnD",
          --     list_definitions_toc = "gO",
          --     goto_next_usage = "<a-*>",
          --     goto_previous_usage = "<a-#>",
          --   },
          -- },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("nvim-treesitter.configs").setup({
        context = {
          enable = true,
          throttle = true,
        },
      })
    end,
  },
}
