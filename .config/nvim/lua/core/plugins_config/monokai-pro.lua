require("monokai-pro").setup({
  -- classic | octagon | pro | machine | ristretto | spectrum
  filter = "octagon",
  terminal_colors = true,
  background_clear = {},
  styles = {
    comment = { italic = true },
    keyword = { italic = true }, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = true }, -- static, register, volatile, etc
    structure = { italic = true }, -- struct, union, enum, etc
    parameter = { italic = true }, -- parameter pass in function
    annotation = { italic = true },
  },
  plugins = {
    bufferline = {
      -- underline_selected = true,
      underline_visible = true,
    },
  },
})
