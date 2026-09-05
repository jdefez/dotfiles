--------------------------------------------------------------------------------
-- move
--------------------------------------------------------------------------------

vim.pack.add({
    {
        src = "https://github.com/A7Lavinraj/fyler.nvim",
        branch = "stable"
    },
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/stevearc/quicker.nvim" },
    { src = "https://github.com/hedyhli/outline.nvim" },
})
require("fyler").setup({
    integrations = { icon = 'mini_icons' },
    extensions = {
        git = { enabled = true }
    },
    ui = {
        hidden_items = {
            switches = {}
        }
    }
})
require("mini.pick").setup()
require("flash").setup({
    modes = {
        char = { enabled = false },
    }
})
require("quicker").setup({})
require("outline").setup({
    outline_window = {
        auto_close = true,
    }
})
