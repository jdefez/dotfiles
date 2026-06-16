--------------------------------------------------------------------------------
-- git
--------------------------------------------------------------------------------

-- TODO: check https://github.com/barrettruth/diffs.nvim

vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/sindrets/diffview.nvim" }, -- neogit dependency
    { src = "https://github.com/NeogitOrg/neogit" },
    -- { src = "https://github.com/MunifTanjim/nui.nvim" }, -- codediff dependency
    -- { src = "https://github.com/esmuellert/codediff.nvim" },
})

require("diffview").setup({
    view = {
        merge_tool = {
            layout = "diff3_mixed",
        },
    },
})

-- require("codediff").setup({
--     explorer = {
--         position = "right",
--     },
-- })
require("neogit").setup({})
require("gitsigns").setup({
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Actions
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>gu', gitsigns.reset_hunk, { desc = 'Reset hunk' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })
        map('n', '<leader>gQ', function() gitsigns.setqflist('all') end, { desc = 'Set quickfix' })
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Toggle blame' })
    end
})
