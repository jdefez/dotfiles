require("palette").setup({
  palettes = {
    -- dark or light
    main = "light",

    -- pastel, bright or dark
    accent = "bright",
    state = "bright",
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
