--------------------------------------------------------------------------------
-- Pint formatter module for PHP files
--------------------------------------------------------------------------------

local M = {}

-- Format current buffer with Pint (Laravel PHP formatter)
function M.format()
    local filepath = vim.fn.expand('%:p')
    local filetype = vim.bo.filetype

    if filetype ~= 'php' then
        vim.notify('Pint is only for PHP files', vim.log.levels.WARN)
        return
    end

    if filepath == '' then
        vim.notify('Buffer has no file path', vim.log.levels.ERROR)
        return
    end

    -- Save current cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- Run Pint formatter (use Mason-installed binary)
    local pint_cmd = vim.fn.stdpath("data") .. "/mason/bin/pint " .. vim.fn.shellescape(filepath)
    local result = vim.fn.system(pint_cmd)
    local exit_code = vim.v.shell_error

    if exit_code == 0 then
        -- Reload buffer to show formatted content
        vim.cmd('edit!')
        -- Restore cursor position
        vim.api.nvim_win_set_cursor(0, cursor_pos)
        vim.notify('Formatted with Pint', vim.log.levels.INFO)
    else
        vim.notify('Pint failed: ' .. result, vim.log.levels.ERROR)
    end
end

return M
