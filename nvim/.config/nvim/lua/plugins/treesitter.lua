return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
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
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>ms",
            node_incremental = "<Leader>mn",
            scope_incremental = "<Leader>mi",
            node_decremental = "<Leader>md",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "Select around function" },
              ["if"] = { query = "@function.inner", desc = "Select inner function" },
              ["ac"] = { query = "@class.outer", desc = "Select around class" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },
            include_surrounding_whitespace = true,
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
              --
              -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
              ["]o"] = "@loop.*",
              -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
              --
              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              -- ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
              -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            -- goto_next = {
            --   ["]d"] = "@conditional.outer",
            -- },
            -- goto_previous = {
            --   ["[d"] = "@conditional.outer",
            -- },
          },
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = false,
          },
          highlight_current_scope = {
            enable = false,
          },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },
          navigation = {
            enable = true,
            -- NOTE: Assign keymaps to false to disable them, e.g. `goto_definition = false`.
            keymaps = {
              goto_definition = false, -- "gnd"
              list_definitions = false, -- "gnD"
              list_definitions_toc = false, -- "gO"
              goto_next_usage = "<M-*>",
              goto_previous_usage = "<M-#>",
            },
          },
        },
      }
    end,
  },
  {
    lazy = false,
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = { "nvim-treesitter/nvim-treesitter" },
    after = "nvim-treesitter",
  },
  {
    lazy = false,
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = { "nvim-treesitter/nvim-treesitter" },
    after = "nvim-treesitter",
  },
}
