--------------------------------------------------------------------------------
-- Helpers for Neovim's native multicursor (:h multicursor)
--------------------------------------------------------------------------------

local M = {}

local ns = vim.api.nvim_create_namespace("nvim.multicursor")

-- Clear all cursors in the current buffer.
-- NOTE: clearing multicursors via a *fed keystroke* (e.g. <C-l>) is unreliable
-- while cursors are active (replay engine bug, neovim/neovim#41959). Calling
-- nvim_buf_clear_namespace() directly as a plain function call sidesteps that,
-- matching what core's own default <C-l> mapping does internally.
function M.clear()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

-- Prompt for a pattern, then place a cursor at each match within the
-- Visually-selected lines, each cursor selecting its match.
function M.match()
    local first, last = vim.fn.line("v"), vim.fn.line(".")
    if first > last then first, last = last, first end
    vim.cmd.normal({ vim.keycode("<Esc>"), bang = true })

    local pattern = vim.fn.input("Cursors pattern: ")
    if pattern == "" then return end

    local ok, matches = pcall(vim.fn.matchbufline, vim.api.nvim_get_current_buf(), pattern, first, last)
    if not ok then
        vim.notify(matches, vim.log.levels.ERROR)
        return
    end
    if #matches == 0 then return end

    -- primary cursor goes on the first match, extra cursors on the others
    vim.fn.setreg("/", pattern)
    vim.api.nvim_win_set_cursor(0, { matches[1].lnum, matches[1].byteidx })
    for i = 2, #matches do
        vim.api.nvim_mcursor(0, { matches[i].lnum, matches[i].byteidx })
    end
    -- enable follow-mode so motions ("w", "fx", ...) are replayed per-cursor,
    -- as {Visual}Q does (placing cursors on matches leaves it off)
    vim.cmd("norm! 1q=")
    -- select the match under each cursor (gn is replayed per-cursor)
    vim.api.nvim_feedkeys("gn", "n", false)
end

return M
