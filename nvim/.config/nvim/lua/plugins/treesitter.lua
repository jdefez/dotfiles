--------------------------------------------------------------------------------
-- treesitter
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter.configs').setup({
    modules = {},
    ignore_install = {},
    sync_install = false,
    auto_install = true,
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "fish",
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
})
