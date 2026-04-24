vim.pack.add({
    { src = "https://github.com/rebelot/kanagawa.nvim" }
})

require("kanagawa").setup({
    theme = "wave",
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
})

vim.cmd.colorscheme "kanagawa"
