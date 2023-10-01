require("palette").setup({
  palettes = {
    -- dark or light
    main = "light",
    -- pastel, bright or dark
    accent = "dark",
    state = "dark",
  },
  italics = true,
  bold = true,
  transparent_background = false,
})

vim.cmd([[
  colorscheme palette
  highlight DiagnosticUnderlineError gui=undercurl
  highlight DiagnosticUnderlineWarn gui=undercurl
  highlight NoiceCursor guibg=darkgrey
  highlight NeogitDiffAdd guifg=#56A665 guibg=#e9e9ed
  highlight NeogitDiffAddHighlight guifg=#56A665 guibg=#e9e9ed
  highlight NeogitDiffDelete guifg=#B15555 guibg=#e9e9ed
  highlight NeogitDiffDeleteHighlight guifg=#B15555 guibg=#e9e9ed
]])
