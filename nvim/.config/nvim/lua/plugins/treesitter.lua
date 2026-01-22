--------------------------------------------------------------------------------
-- treesitter
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter.configs').setup({
    ignore_install = {},
    auto_install = true,
    sync_install = false,
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
    -- highlight = {
    --     enable = true,
    --     additional_vim_regex_highlighting = false,
    -- },
    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --         init_selection = "gnn",
    --         mode_incremental = "grn",
    --         node_decremental = "grm",
    --         scope_incremental = "grc",
    --     },
    -- },
})
