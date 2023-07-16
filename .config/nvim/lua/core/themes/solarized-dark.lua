-- some comment
require('solarized').setup({
  theme = "neo",
  styles = {
    comments = { italic = true },
    functions = { italic = true, bold = true },
    variables = { bold = true },
    numbers = {},
    constants = {},
    parameters = {},
    keywords = { italic = true },
    types = {},
  },
  highlights = function(colors, colorhelper)
    -- local darken = colorhelper.darken
    local lighten = colorhelper.lighten
    -- local blend = colorhelper.blend

    return {
      ColorColumn = { bg = lighten(colors.base02, 0.9) },
    }
  end,
});

vim.cmd("colorscheme solarized")
vim.cmd("set background=dark")

vim.cmd [[
    hi InclineNormal gui=italic
]]
