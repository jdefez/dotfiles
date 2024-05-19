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
        -- TODO: map keys for:
        --  - @conditional.inner - @conditional.outer
        --  - @block.inner / @block.outer
        --  - @call.inner / @call.outer
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- method / function
              ["am"] = { query = "@function.outer", desc = "Select outter function" },
              ["im"] = { query = "@function.inner", desc = "Select inner function" },
              -- conditional
              ["ac"] = { query = "@conditional.outer", desc = "Select outter conditional" },
              ["ic"] = { query = "@conditional.inner", desc = "Select inner conditional" },
              -- class
              ["ak"] = { query = "@class.outer", desc = "Select outter class" },
              ["ik"] = { query = "@class.inner", desc = "Select inner class" },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]ms"] = { query = "@function.outer", desc = "Goto next function start" },
              ["]ks"] = { query = "@class.outer", desc = "Goto next class start" },
              ["]cs"] = { query = "@conditional.outer", desc = "Goto next conditional start" },
            },
            goto_next_end = {
              ["]me"] = { query = "@function.outer", desc = "Goto next function end" },
              ["]ke"] = { query = "@class.outer", desc = "Goto next class end" },
              ["]ce"] = { query = "@conditional.outer", desc = "Goto next conditional end" },
            },
            goto_previous_start = {
              ["[ms"] = { query = "@function.outer", desc = "Goto previous function start" },
              ["[ks"] = { query = "@class.outer", desc = "Goto previous class start" },
              ["[cs"] = { query = "@conditional.outer", desc = "Goto previous conditional start" },
            },
            goto_previous_end = {
              ["[me"] = { query = "@function.outer", desc = "Goto previous function end" },
              ["[ke"] = { query = "@class.outer", desc = "Goto previous class end" },
              ["[ce"] = { query = "@conditional.outer", desc = "Goto previous conditional end" },
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
