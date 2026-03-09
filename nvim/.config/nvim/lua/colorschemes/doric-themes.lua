--------------------------------------------------------------------------------
-- doric-themes
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/aymenhafeez/doric-themes.nvim" }
})

require("doric").setup({
  light = "doric-light", -- doric-beach, -cherry, -earth, -jade, -marble, -oak, -siren, -wind
  dark = "doric-water" -- doric-copper, -dark, -fire, -mermaid, -obsidian, -pine, -plum, -valley
})

vim.cmd.colorscheme("doric-light")
vim.opt.background = "light"

