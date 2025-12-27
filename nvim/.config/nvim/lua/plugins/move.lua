--------------------------------------------------------------------------------
-- move
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/benomahony/oil-git.nvim" }, -- depends on oil
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/stevearc/quicker.nvim" },
    { src = "https://github.com/ahkohd/buffer-sticks.nvim" },
    { src = "https://github.com/hedyhli/outline.nvim" },
})
require("oil").setup()
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
