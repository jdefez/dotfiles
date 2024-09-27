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
          "query",
          "json",
          "html",
          "yaml",
          "vue",
          "css",
          "lua",
          "php",
          "sql",
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
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   requires = "nvim-treesitter/nvim-treesitter",
  --   config = function()
  --     local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

  --     -- Repeat movement with ; and ,
  --     -- ensure ; goes forward and , goes backward regardless of the last direction
  --     vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
  --     vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

  --     require("nvim-treesitter.configs").setup({
  --       -- TODO: map keys for:
  --       --  - @block.inner / @block.outer
  --       --  - @call.inner / @call.outer
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           lookahead = true,
  --           keymaps = {
  --             -- method / function
  --             ["am"] = { query = "@function.outer", desc = "Select outter function" },
  --             ["im"] = { query = "@function.inner", desc = "Select inner function" },
  --             -- conditional
  --             ["ac"] = { query = "@conditional.outer", desc = "Select outter conditional" },
  --             ["ic"] = { query = "@conditional.inner", desc = "Select inner conditional" },
  --             -- class
  --             ["ak"] = { query = "@class.outer", desc = "Select outter class" },
  --             ["ik"] = { query = "@class.inner", desc = "Select inner class" },
  --             -- statement
  --             ["as"] = { query = "@statement.outer", desc = "Select outter statement" },
  --             ["is"] = { query = "@statement.inner", desc = "Select inner statement" },
  --             -- parameter
  --             ["ap"] = { query = "@parameter.outer", desc = "Select outter parameter" },
  --             ["ip"] = { query = "@parameter.inner", desc = "Select inner parameter" },
  --             -- loop
  --             ["al"] = { query = "@loop.outer", desc = "Select outter loop" },
  --             ["il"] = { query = "@loop.inner", desc = "Select inner loop" },
  --           },
  --         },
  --         move = {
  --           enable = true,
  --           set_jumps = true,
  --           goto_next_start = {
  --             ["]ms"] = { query = "@function.outer", desc = "Goto next function start" },
  --             ["]ks"] = { query = "@class.outer", desc = "Goto next class start" },
  --             ["]cs"] = { query = "@conditional.outer", desc = "Goto next conditional start" },
  --             ["]ps"] = { query = "@parameter.outer", desc = "Goto next parameter start" },
  --           },
  --           goto_next_end = {
  --             ["]me"] = { query = "@function.outer", desc = "Goto next function end" },
  --             ["]ke"] = { query = "@class.outer", desc = "Goto next class end" },
  --             ["]ce"] = { query = "@conditional.outer", desc = "Goto next conditional end" },
  --             ["]pe"] = { query = "@parameter.outer", desc = "Goto next parameter end" },
  --           },
  --           goto_previous_start = {
  --             ["[ms"] = { query = "@function.outer", desc = "Goto previous function start" },
  --             ["[ks"] = { query = "@class.outer", desc = "Goto previous class start" },
  --             ["[cs"] = { query = "@conditional.outer", desc = "Goto previous conditional start" },
  --             ["[ps"] = { query = "@parameter.outer", desc = "Goto previous parameter start" },
  --           },
  --           goto_previous_end = {
  --             ["[me"] = { query = "@function.outer", desc = "Goto previous function end" },
  --             ["[ke"] = { query = "@class.outer", desc = "Goto previous class end" },
  --             ["[ce"] = { query = "@conditional.outer", desc = "Goto previous conditional end" },
  --             ["[pe"] = { query = "@parameter.outer", desc = "Goto previous parameter end" },
  --           },
  --         },
  --         swap = {
  --           enable = true,
  --           swap_next = {
  --             ["g]"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
  --           },
  --           swap_previous = {
  --             ["g["] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
  --           },
  --         },
  --       },
  --     })
  --   end
  -- },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = "nvim-treesitter/nvim-treesitter",
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
        },
      })
    end,
  },
}
