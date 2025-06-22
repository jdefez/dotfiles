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
    config = function()
      require("nvim-treesitter.configs").setup {
        --  TODO:
        --  - make the movements repeatable: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        --  - lsp interoperability: https://github.com/nvim-treesitter/nvim-treesitter-textobjects#textobjects-lsp-interop
        highlight = {
          enable = true,
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = false,
          },
          highlight_current_scope = { enable = false },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },
        },
        incremental_selection = {
          enable = false,
          keymaps = {
            -- set to `false` to disable one of the mappings
            -- FIXME : conflicting with flash + <sn not whowing in mappings
            init_selection = "<leader>ss",
            node_incremental = "<leader>sn",
            scope_incremental = "<leader>si",
            node_decremental = "<leader>sd",
          },
        },
        -- navigation = {
        --   enable = true,
        --   -- NOTE: Assign keymaps to false to disable them, e.g. `goto_definition = false`.
        --   keymaps = {
        --     goto_definition = false, -- "gnd"
        --     list_definitions = false, -- "gnD"
        --     list_definitions_toc = false, -- "gO"
        --     goto_next_usage = "<M-*>",
        --     goto_previous_usage = "<M-#>",
        --   },
        -- },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- ["ac"] = "@class.outer",
              -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              -- ["@class.outer"] = "<c-v>", -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      }
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-refactor",
  --   requires = { "nvim-treesitter/nvim-treesitter" },
  --   lazy = false,
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   requires = { "nvim-treesitter/nvim-treesitter" },
  --   lazy = false,
  -- },
  {
    "aaronik/treewalker.nvim",
    lazy = false,
    opts = {
      highlight = true, -- default is false
    },
    requires = { "nvim-treesitter/nvim-treesitter" },
  },
}
