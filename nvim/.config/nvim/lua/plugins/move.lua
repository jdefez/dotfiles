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
    { src = "https://github.com/ahkohd/buffer-sticks.nvim" },
    { src = "https://github.com/hedyhli/outline.nvim" },
})
require("fyler").setup({
    integrations = { icon = 'mini_icons' },
    extensions = {
        git = { enabled = true }
    },
    views = {
        finder = {
            follow_current_file = false,
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
require("buffer-sticks").setup({
    filter = {
        filetypes = { "help", "qf" },         -- Exclude by filetype (also: "NvimTree", "neo-tree", "Trouble")
        buftypes = { "terminal" },            -- Exclude by buftype (also: "help", "quickfix", "nofile")
        names = { ".*%.git/.*", "^/tmp/.*" }, -- Exclude buffers matching lua patterns
    },
})
require("outline").setup({
    outline_window = {
        auto_close = true,
    }
})
