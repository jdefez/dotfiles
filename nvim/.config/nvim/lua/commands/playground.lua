
--------------------------------------------------------------------------------
-- CopyPath
-- Copy the path (relative to the current working directory) to the clipboard
--------------------------------------------------------------------------------

vim.api.nvim_create_user_command('CopyPath',
    function(opts)
        local path = vim.fn.expand('%:p')

        if #path == nil then
            print('copied path: ' .. path)
            vim.fn.setreg('+', path)
        end
    end,
    {
        -- '*' means 0 or more arguments '+'
        -- means 1 or more
        -- 1 means exactly 1
        nargs = '*',
        -- complete = function()
        --     return { 'hello', 'world' }
        -- end,
        desc = 'Playing with user commands',
    }
)
