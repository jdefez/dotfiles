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
          enable = true,
          keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            node_decremental = "<C-p>",
            scope_incremental = false,
          },
        },
        navigation = {
          -- fixme: not working on ghostty
          enable = false,
          -- NOTE: Assign keymaps to false to disable them, e.g. `goto_definition = false`.
          keymaps = {
            goto_definition = false, -- "gnd"
            list_definitions = false, -- "gnD"
            list_definitions_toc = false, -- "gO"
            goto_next_usage = "<A-n>",
            goto_previous_usage = "<A-d>",
          },
        },
        textobjects = {
          enable = true,
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- Available for php
              --
              -- @block.inner
              -- @block.outer
              -- @call.inner
              -- @call.outer
              -- @class.inner
              -- @class.outer
              -- @comment.outer
              -- @conditional.inner
              -- @conditional.outer
              -- @function.inner
              -- @function.outer
              -- @loop.inner
              -- @loop.outer
              -- @parameter.inner
              -- @parameter.outer
              -- @statement.outer
              -- assignment

              -- parameter
              ["ap"] = { query = "@parameter.outer", desc = "Parameter outer" },
              ["ip"] = { query = "@parameter.inner", desc = "Parameter inner" },

              -- conditional
              ["ai"] = { query = "@conditional.outer", desc = "Conditional outer" },
              ["ii"] = { query = "@conditional.inner", desc = "Conditional inner" },

              -- loop
              ["al"] = { query = "@loop.outer", desc = "Loop outer" },
              ["il"] = { query = "@loop.inner", desc = "Loop inner" },

              -- call
              ["af"] = { query = "@call.outer", desc = "Function/Method call outer" },
              ["if"] = { query = "@call.inner", desc = "Function/Method call inner" },

              -- function
              ["am"] = { query = "@function.outer", desc = "Function/Method outer" },
              ["im"] = { query = "@function.inner", desc = "Function/Method inner" },

              -- class
              ["ac"] = { query = "@class.outer", desc = "Class outer" },
              ["ic"] = { query = "@class.inner", desc = "Cass inner" },

              -- statement
              ["is"] = { query = "@statement.outer", desc = "Statement outer" },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = { query = "@call.outer", desc = "Next function call start" },
              ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
              ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]F"] = { query = "@call.outer", desc = "Next function call end" },
              ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
              ["]C"] = { query = "@class.outer", desc = "Next class end" },
              ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
              ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
              ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
              ["[c"] = { query = "@class.outer", desc = "Prev class start" },
              ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
              ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
            },
            goto_previous_end = {
              ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
              ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
              ["[C"] = { query = "@class.outer", desc = "Prev class end" },
              ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
              ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
            },
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
  },
  -- {
  --   "aaronik/treewalker.nvim",
  --   lazy = false,
  --   opts = {
  --     highlight = true, -- default is false
  --   },
  --   requires = { "nvim-treesitter/nvim-treesitter" },
  -- },
}
