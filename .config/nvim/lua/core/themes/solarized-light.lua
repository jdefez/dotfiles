-- some comment
require('solarized').setup({
  theme = "neo",
  styles = {
    comments = { italic = true },
    functions = { italic = false, bold = true },
    variables = { bold = true, italic = false },
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
      ColorColumn = { bg = darken(colors.base02, 0.5) },
    }
  end,
});

vim.cmd("colorscheme solarized")
vim.cmd("set background=light")

vim.cmd [[
    hi InclineNormal gui=italic
]]
