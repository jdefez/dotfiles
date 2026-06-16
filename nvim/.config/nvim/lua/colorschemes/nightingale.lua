--------------------------------------------------------------------------------
-- nightingale
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/xeind/nightingale.nvim" }
})

require("nightingale").setup({
    transparent = false,
    commentStyle = { italic = true },
    functionStyle = { italic = true, bold = true },
    keywordStyle = { bold = true },
    statementStyle = {},
    typeStyle = {},
})

vim.cmd.colorscheme("lightingale")

