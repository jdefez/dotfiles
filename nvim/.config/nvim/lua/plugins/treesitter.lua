--------------------------------------------------------------------------------
-- treesitter
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter.configs').setup({
    ignore_install = {},
    auto_install = true,
    ensure_installed = {
        "bash",
        "blade",
        "css",
        "diff",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "phpdoc",
        "sql",
        "typescript",
        "xml",
        "yaml",
        "vue",
    },
    modules = {
        highlight = {
            enable = true,
            -- additional_vim_regex_highlighting = false,
            -- custom_captures = {},
            -- disable = {},
            -- module_path = "nvim-treesitter.highlight",
            -- keymaps = {}
        },
        incremental_selection = {
            enable = false,
            -- disable = {},
            -- keymaps = {
            --     init_selection = "gnn",
            --     node_decremental = "grm",
            --     node_incremental = "grn",
            --     scope_incremental = "grc"
            -- },
            -- module_path = "nvim-treesitter.incremental_selection"
        },
        indent = {
            enable = false,
            -- disable = {},
            -- module_path = "nvim-treesitter.indent"
        }
    },
    sync_install = false
})
