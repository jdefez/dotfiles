require('configs')
require('keymaps')
require('plugins')

-- LSP

vim.lsp.enable({
    "jsonls",
    "laravel_ls",
    "lemminx", -- xml
    "lua_ls",
    "pest_ls",
    "phpactor",
    "yamlls",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

-- Treesitter

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
        highlight_current_scope = { enable = true },
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

-- Plugins configs

local keymap = vim.keymap

require "mini.pick".setup()
keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fw", ":Pick grep<CR>", { desc = "Grep" })

require "oil".setup()
keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil explore" })

require('gitsigns').setup({ signcolumn = true })

require("mason").setup({})

require("flash").setup({})
keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash jump" })
keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash treesitter" })
keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Flash Treesitter search" })

require("neogit").setup({})
keymap.set("n", "<leader>G", "<cmd>Neogit kind=vsplit<CR>", { desc = "Neogit open" })

require("nvim-surround").setup({})

require("fastaction").setup({})
keymap.set(
    { 'n', 'x' },
    '<leader>ca',
    '<cmd>lua require("fastaction").code_action({ select_first = true })<CR>',
    { desc = "Select and apply first code action", buffer = bufnr }
)

-- UI
require("ibl").setup()

-- vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")
vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")
