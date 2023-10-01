require("palette").setup({
  palettes = {
    -- dark or light
    main = "dark",
    -- pastel, bright or dark
    accent = "bright",
    state = "bright",
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
