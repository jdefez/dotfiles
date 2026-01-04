--------------------------------------------------------------------------------
-- treesitter
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

require('nvim-treesitter').install({
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
})
