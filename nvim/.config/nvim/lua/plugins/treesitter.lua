--------------------------------------------------------------------------------
-- treesitter
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }, -- after nvim-treesitter
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-refactor" },    -- after nvim-treesitter
})

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
            -- set to `false` to disable one of the mappings
            scope_incremental = false,
            init_selection = "<c-n>",
            node_incremental = "<c-n>",
            node_decremental = "<c-p>",
        },
    },
    textobjects = {
        enable = true,
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- available for php
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
                goto_definition = false,
                list_definitions = false,
                list_definitions_toc = false,
                goto_next_usage = "<A-n>",
                goto_previous_usage = "<A-p>",
            },
        },
    },
})
