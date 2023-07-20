-- some comment
require('solarized').setup({
  theme = "neo",
  styles = {
    comments = { italic = true },
    functions = { bold = true, italic = false },
    variables = { italic = false },
    numbers = { italic = false },
    constants = { italic = false },
    parameters = { italic = false },
    keywords = { italic = false },
    types = {},
  },
  highlights = function(colors, colorhelper)
    local darken = colorhelper.darken
    -- local lighten = colorhelper.lighten
    -- local blend = colorhelper.blend

    return {
      ColorColumn = { bg = darken(colors.base02, 0.5) }
    }
  end,
});

vim.cmd("colorscheme solarized")
vim.cmd("set background=light")

vim.cmd([[
  highlight DiagnosticUnderlineWarn gui=undercurl
  highlight DiagnosticUnderlineError gui=undercurl
]])


-- vim.cmd [[
--     hi InclineNormal gui=italic
-- ]]
