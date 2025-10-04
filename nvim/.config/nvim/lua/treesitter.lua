require "nvim-treesitter.configs".setup({
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
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    refactor = {
        smart_rename = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
            keymaps = {
                smart_rename = "grr",
            },
        },
        highlight_current_scope = { enable = false },
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
        navigation = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
})

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = false,
    float = {
        source = 'always',
        show_header = true,
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = true, -- default to false
    severity_sort = true,    -- default to false
})
