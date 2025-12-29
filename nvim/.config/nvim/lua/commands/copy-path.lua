--------------------------------------------------------------------------------
-- command Copypath
-- Copy the path to the clipboard (absolute, relative or filename)
--------------------------------------------------------------------------------

vim.api.nvim_create_user_command('Copypath',
    function(opts)
        local path = nil
        local type = opts.args ~= '' and opts.args or 'filename'

        if type == 'filename' then
            path = vim.fn.expand('%:t')
        elseif type == 'relative' then
            path = vim.fn.expand('%:~:.')
        elseif type == 'absolute' then
            path = vim.fn.expand('%:p')
        end

        if path ~= nil then
            vim.fn.setreg('+', path)
            print('Path copied : ' .. path)
        end
    end,
    {
        nargs = '*',
        complete = function()
            return { 'filename', 'relative', 'absolute' }
        end,
        desc = 'Copy buffer path to the clipboard (absolute, relative or filename)',
    }
)
