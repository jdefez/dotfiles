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
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = false },
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
}
