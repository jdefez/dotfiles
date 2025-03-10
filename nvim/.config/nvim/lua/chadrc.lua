-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.term = {
  enabled = false,
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

M.lsp = {
  signature = true,
}

M.ui = {
  cmp = {
    icons_left = true,
  },
}

M.base46 = {
  theme = "ayu_light",

  integrations = {
    -- "flash",
    "git-conflict",
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  hl_add = {
    DiagnosticUnderlineError = { undercurl = true },
    DiagnosticUnderlineWarn = { undercurl = true },

    -- GitConflictCurrent = { bg = "#ffffff" },
    -- GitConflictIncoming = { bg = "#ffffff" },
    -- GitConflictAncestor = { bg = "#ffffff" },
    -- GitConflictCurrentLabel = { bg = "#ffffff", bold = true },
    -- GitConflictIncomingLabel = { bg = "#ffffff", bold = true },
    -- GitConflictAncestorLabel = { bg = "#ffffff", bold = true },

    -- DiffAdd = { bg = "#ffffff", fg = "#00ff00" },
    -- DiffAdded = { bg = "#ffffff", fg = "#00ff00" },
    -- DiffChange = { bg = "#ffffff", fg = "#00ff00" },
    -- DiffDelete = { bg = "#ffffff", fg = "#ff0000", italic = true },
    -- DiffChangeDeleted = { bg = "#ffffff", fg = "#ff0000", italic = true },
    -- DiffText = { bg = "#ffffff", fg = "#ff0000" },

    FlashMatch = { fg = "#337aff", bg = "" },
    FlashLabel = { fg = "#ff0000", bg = "" },
    FlashCursor = { fg = "#7033ff", bg = "" },
    FlashCurrent = { fg = "#48ff33", bg = "" },
  },
}

return M
