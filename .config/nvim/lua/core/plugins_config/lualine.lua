local lualine = require('lualine').setup({
  options = {
    theme = 'visual_studio_code',
    icons_enabled = false,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    globalstatus = true,
    refresh = {
      statusline = 100,
    },
    sections = require("visual_studio_code").get_lualine_sections(),
  }
})
