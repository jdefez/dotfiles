--------------------------------------------------------------------------------
-- shades-of-purple
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/necrogoru/shades-of-purple.nvim" }
})

require("shades-of-purple").setup()

local collect = require("modules.collection").collect
local colors = require("shades-of-purple.colors")
local highlights = collect({
    { hi = "VirtColumn", opt = {fg = colors.purple} },
    -- Neogit highlights
    { hi = "NeogitChangeAdded", opt = { fg = colors.git_add, bold = true, italic = true }},
    { hi = "NeogitChangeBothModified", opt = { fg = colors.git_change, bold = true, italic = true }},
    { hi = "NeogitChangeCopied", opt = { fg = colors.git_untracked, bold = true, italic = true }},
    { hi = "NeogitChangeDeleted", opt = { fg = colors.git_delete, bold = true, italic = true }},
    { hi = "NeogitChangeModified", opt = { fg = colors.git_change, bold = true, italic = true }},
    { hi = "NeogitChangeNewFile", opt = { fg = colors.git_stage, bold = true, italic = true }},
    { hi = "NeogitChangeRenamed", opt = { fg = colors.git_rename, bold = true, italic = true }},
    { hi = "NeogitChangeUpdated", opt = { fg = colors.git_change, bold = true, italic = true }},
    { hi = "NeogitDiffAddHighlight", opt = { bg = colors.git_add }},
    { hi = "NeogitDiffDeleteHighlight", opt = { bg = colors.git_delete}},
    { hi = "NeogitDiffContextHighlight", opt = { bg = colors.git_delete}},
    -- { hi = "NeogitFilePath", opt = { fg = palette.foam, italic = true }},
    -- { hi = "NeogitHunkHeader", opt = { bg = groups.panel }},
    -- { hi = "NeogitHunkHeaderHighlight", opt = { bg = groups.panel }},

    { hi = "DiffAdd", opt = { bg = colors.git_add }}, -- blend = 20
    { hi = "DiffChange", opt = { bg = colors.git_change }}, -- blend = 20
    { hi = "DiffDelete", opt = { bg = colors.git_delete}}, -- blend = 20
    { hi = "DiffText", opt = { bg = colors.git_text}}, -- blend = 40
    { hi = "diffAdded", opt = { bg = colors.git_add }},
    { hi = "diffChanged", opt = { bg = colors.git_change }},
    { hi = "diffRemoved", opt = { bg = colors.git_delete }},

    -- TODO: implement diffview highlights (@see https://github.com/rose-pine/neovim/blob/cf2a288696b03d0934da713d66c6d71557b5c997/lua/rose-pine.lua#L1039)
  
    -- DiffviewPrimary = { fg = palette.pine },
    -- DiffviewSecondary = { fg = palette.foam },
    -- DiffviewNormal = { fg = palette.text, bg = palette.surface },
    -- DiffviewWinSeparator = { fg = palette.text, bg = palette.surface },
    --
    -- DiffviewFilePanelTitle = { fg = palette.foam, bold = styles.bold },
    -- DiffviewFilePanelCounter = { fg = palette.rose },
    -- DiffviewFilePanelRootPath = { fg = palette.foam, bold = styles.bold },
    -- DiffviewFilePanelFileName = { fg = palette.text },
    -- DiffviewFilePanelSelected = { fg = palette.gold },
    -- DiffviewFilePanelPath = { link = "Comment" },
    --
    -- DiffviewFilePanelInsertions = { fg = groups.git_add },
    -- DiffviewFilePanelDeletions = { fg = groups.git_delete },
    -- DiffviewFilePanelConflicts = { fg = groups.git_merge },
    -- DiffviewFolderName = { fg = palette.foam, bold = styles.bold },
    -- DiffviewFolderSign = { fg = palette.subtle },
    -- DiffviewHash = { fg = palette.rose },
    -- DiffviewReference = { fg = palette.foam, bold = styles.bold },
    -- DiffviewReflogSelector = { fg = palette.rose },
    -- DiffviewStatusAdded = { fg = groups.git_add },
    -- DiffviewStatusUntracked = { fg = groups.untracked },
    -- DiffviewStatusModified = { fg = groups.git_change },
    -- DiffviewStatusRenamed = { fg = groups.git_rename },
    -- DiffviewStatusCopied = { fg = groups.untracked },
    -- DiffviewStatusTypeChange = { fg = groups.git_change },
    -- DiffviewStatusUnmerged = { fg = groups.git_change },
    -- DiffviewStatusUnknown = { fg = groups.git_delete },
    -- DiffviewStatusDeleted = { fg = groups.git_delete },
    -- DiffviewStatusBroken = { fg = groups.git_delete },
    -- DiffviewStatusIgnored = { fg = groups.git_ignore },
}):each(function(value)
    vim.api.nvim_set_hl(0, value.hi, value.opt)
end)
