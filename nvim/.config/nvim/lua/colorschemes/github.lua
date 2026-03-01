vim.pack.add({
    {
        src = "https://github.com/projekt0n/github-nvim-theme",
    }
})

-- some comments

require('github-theme').setup({
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            functions = "bold",
            strings = "NONE",
            variables = "NONE",
        },
    },
    groups = {
        all = {
            VirtColumn = { fg = "green" },
        }
    }
})

vim.cmd.colorscheme "github_light_tritanopia"
