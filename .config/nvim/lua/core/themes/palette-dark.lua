require("palette").setup({
  palettes = {
    -- dark or light
    main = "dark",

    -- pastel, bright or dark
    accent = "pastel",
    state = "pastel",
  },

  italics = true,
  bold = true,
  transparent_background = false,
})

vim.cmd("colorscheme palette")

vim.cmd([[
  highlight DiagnosticUnderlineWarn gui=undercurl
  highlight DiagnosticUnderlineError gui=undercurl
]])
