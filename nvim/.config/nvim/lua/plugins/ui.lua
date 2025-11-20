--------------------------------------------------------------------------------
-- ui
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/echasnovski/mini.extra" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/xiyaowong/virtcolumn.nvim" },
    { src = "https://github.com/okuuva/auto-save.nvim" },
    { src = "https://github.com/echasnovski/mini.bufremove" },
    { src = "https://github.com/echasnovski/mini.animate" },
    { src = "https://github.com/echasnovski/mini.statusline" },
    { src = "https://github.com/echasnovski/mini.sessions" },
    { src = "https://github.com/echasnovski/mini.clue" },
    { src = "https://github.com/SmiteshP/nvim-navic" }, -- barbecue dependency
    { src = "https://github.com/utilyre/barbecue.nvim" },
    { src = "https://github.com/echasnovski/mini.starter" },
})

require('mini.extra').setup()
require("auto-save").setup({})
require("mini.bufremove").setup({})
require("mini.animate").setup({})
require("mini.statusline").setup({})
require("mini.starter").setup({})
require("barbecue").setup({
    theme = "default"
})
require("mini.sessions").setup({
    autoread = false,
    autowrite = true,
    hooks = {
        post = {
            read = function(session_data)
                -- Find .git directory
                local bufnr = vim.api.nvim_get_current_buf()
                local bufname = vim.api.nvim_buf_get_name(bufnr)

                if bufname and bufname ~= '' then
                    local buf_dir = vim.fn.fnamemodify(bufname, ':h')
                    local git_dir = vim.fs.find('.git', {
                        path = buf_dir,
                        upward = true,
                    })[1]

                    if git_dir then
                        local root_dir = vim.fn.fnamemodify(git_dir, ':h')
                        vim.cmd('cd ' .. vim.fn.fnameescape(root_dir))
                        print('Changed directory to: ' .. root_dir)
                    else
                        print('No .git directory found, keeping current directory')
                    end
                else
                    print('No buffer loaded, cannot determine project root')
                end
            end,
        },
    }
})
