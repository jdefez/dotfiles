--------------------------------------------------------------------------------
-- ember-theme
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/ember-theme/nvim", as = "ember" }
})

require("ember").setup({
    -- "ember" | "ember-soft" | "ember-light"
    variant = "ember-light",
})

vim.cmd.colorscheme("ember-light")
