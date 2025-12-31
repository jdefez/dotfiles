--------------------------------------------------------------------------------
-- Terminal commands
--------------------------------------------------------------------------------

-- NOTE:
-- Opens a terminal in an individual split (horizontally or vertically).
-- If the terminal buffer is already open, it will be reused

-- TODO:
-- - add a command to close the terminal buffer
-- - handle both a command argument and an optional split argument

local find_terminal_buffer = function()
    local bufs = vim.api.nvim_list_bufs()

    for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_get_name(buf):match('^term://')
            and vim.api.nvim_buf_is_valid(buf)
        then
            return buf
        end
    end

    return nil
end

local filter_options = function(ArgLead)
    return vim.tbl_filter(function(opt)
        return vim.startswith(opt, ArgLead)
    end, { 'horizontal', 'vertical' })
end

vim.api.nvim_create_user_command(
    'Term',
    function(opts)
        local split = 'vsplit'
        if opts.fargs[1] == 'horizontal' then
            split = 'split'
        end

        local term_buff_id = find_terminal_buffer()

        if term_buff_id == nil then
            vim.cmd(split .. ' | terminal')
        else
            vim.api.nvim_open_win(term_buff_id, true, {
                vertical = split == 'vsplit',
            })
        end

        -- add a local binding to close the terminal buffer.
    end,
    {
        desc = 'Open a terminal buffer',
        nargs = '?',
        complete = filter_options,
    }
)
