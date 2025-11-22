vim.api.nvim_create_user_command('Play',
    function(opts)
        if #opts.fargs == 0 then
            print('No arguments provided')
        else
            print(opts.fargs[1])
        end
    end,
    {
        -- '*' means 0 or more arguments '+'
        -- means 1 or more
        -- 1 means exactly 1
        nargs = '*',
        complete = function()
            return { 'hello', 'world' }
        end,
        desc = 'Playing with user commands',
    }
)
