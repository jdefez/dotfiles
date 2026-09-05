--------------------------------------------------------------------------------
-- edit
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/kylechui/nvim-surround" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/nvim-mini/mini.indentscope" },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/supermaven-inc/supermaven-nvim" },
})

require("nvim-surround").setup({})
require("mini.pairs").setup({})
require("mini.indentscope").setup({})
require("todo-comments").setup({})

require("supermaven-nvim").setup({
    keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-w>",
    }
})
