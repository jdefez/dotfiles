-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.term = {
  winopts = {
    cc = "500",
  },
  sizes = {
    sp = 0.4,
    vsp = 0.4,
  },
  float = {
    row = 0.1,
    col = 0.15,
    width = 0.7,
    height = 0.7,
  },
}

M.base46 = {
  theme = "nightfox",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  hl_add = {
    DiagnosticUnderlineError = { undercurl = true },
    DiagnosticUnderlineWarn = { undercurl = true },

    FlashMatch = { fg = "#337aff", bg = "" },
    FlashLabel = { fg = "#ff0000", bg = "" },
    FlashCursor = { fg = "#7033ff", bg = "" },
    FlashCurrent = { fg = "#48ff33", bg = "" },
  },
}

return M
