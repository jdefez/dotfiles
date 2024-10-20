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
    config = function()
      require("nvim-treesitter.configs").setup {
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
      }
    end,
  },
}
