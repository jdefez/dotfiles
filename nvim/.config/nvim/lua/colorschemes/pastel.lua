
-------------------------------------------------------------------------------
-- pastel.nvim
-------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/ankushbhagats/pastel.nvim" }
})

require("pastel").setup({
    style = {
        italic = true,
    }
})

vim.cmd("colorscheme pastel")
