return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 
    "nvim-tree/nvim-web-devicons",
    "askfiy/visual_studio_code"
  },
  init = function()
    require("lualine").setup({
      options = {
        theme = "visual_studio_code",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = require("visual_studio_code").get_lualine_sections(),
    })
  end,
}
