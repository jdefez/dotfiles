require('configs')
require('keymaps')
require('plugins')

-- LSP

vim.lsp.enable({ "lua_ls", "phpactor" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

require "nvim-treesitter.configs".setup({
    ensure_installed = {
        "javascript",
        "markdown",
        "html",
        "json",
        "yaml",
        "xml",
        "php",
    },
    highlight = { enable = true }
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

-- ui

-- vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")
