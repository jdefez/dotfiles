local option = vim.opt
local keymap = vim.keymap

-- Options

vim.g.mapleader = " "

option.updatetime = 250
option.swapfile = false
option.number = true
option.signcolumn = "yes"
option.wrap = false
option.expandtab = true
option.shiftwidth = 4
option.tabstop = 4
option.winborder = "rounded"
option.clipboard = "unnamedplus"

-- Keymapings

keymap.set("i", "<S-TAB>", "<C-x><C-o>", { desc = "Trigger completion" })
keymap.set("n", "<C-s>", ":write<CR>", { desc = "Save" })
keymap.set("n", "<leader>s", ":update<CR> :source<CR>", { desc = "Update and source" })
keymap.set("i", "jk", "<ESC>", { desc = "Escape" })
keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/vague2k/vague.nvim" },
})

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
        "php", "typescript", "javascript", "markdown", "html", "json"
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

require "mini.pick".setup()
keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fw", ":Pick grep<CR>", { desc = "Grep" })

require "oil".setup()
keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil explore" })

-- UI

vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")
