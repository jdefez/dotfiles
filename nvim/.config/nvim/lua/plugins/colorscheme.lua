--------------------------------------------------------------------------------
-- Color scheme
--------------------------------------------------------------------------------

-- local option = vim.opt
local cmd = vim.cmd

cmd("hi statusline guibg=NONE")
cmd("hi DiagnosticUnderlineError gui=undercurl")
cmd("hi DiagnosticUnderlineWarn gui=undercurl")

vim.pack.add({
    {
        src = "https://github.com/rose-pine/neovim",
        name = "rose-pine"
    },
})

require('rose-pine').setup({
    -- variant = "auto",      -- auto, main, moon, or dawn
    -- dark_variant = "dawn", -- main, moon, or dawn
    dim_inactive_windows = true,
    extend_background_behind_borders = true,
    highlight_groups = {
        VirtColumn = { fg = "love" },
        CurSearch = { fg = "base", bg = "leaf", inherit = false },
        Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
        -- OilGitAdded = { fg = "foam" },
        -- OilGitModified = { fg = "rose" },
        -- OilGitRenamed = { fg = "pine" },
        -- OilGitUntracked = { fg = "subtle" },
        -- OilGitIgnored = { fg = "muted" }
    },
    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },
})

cmd.colorscheme "rose-pine"
