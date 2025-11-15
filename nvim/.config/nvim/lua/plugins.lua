vim.pack.add({
    ----------------------------------------------------------------------------
    -- ui
    ----------------------------------------------------------------------------

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

    ----------------------------------------------------------------------------
    -- lsp
    ----------------------------------------------------------------------------

    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/phpactor/phpactor" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/Chaitanyabsprip/fastaction.nvim" },
    -- { src = "https://github.com/DNLHC/glance.nvim" },

    ----------------------------------------------------------------------------
    -- treesitter
    ----------------------------------------------------------------------------

    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }, -- after nvim-treesitter
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-refactor" },    -- after nvim-treesitter

    ----------------------------------------------------------------------------
    -- edit
    ----------------------------------------------------------------------------

    { src = "https://github.com/kylechui/nvim-surround" },
    { src = "https://github.com/echasnovski/mini.pairs" },
    { src = "https://github.com/echasnovski/mini.indentscope" },
    { src = "https://github.com/jake-stewart/multicursor.nvim" },
    { src = "https://github.com/folke/todo-comments.nvim" },

    ----------------------------------------------------------------------------
    -- completion
    ----------------------------------------------------------------------------

    { src = "https://github.com/supermaven-inc/supermaven-nvim" }, -- supertab dependency
    -- { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    -- { src = "https://github.com/hrsh7th/cmp-buffer" },
    -- { src = "https://github.com/hrsh7th/cmp-path" },
    -- { src = "https://github.com/hrsh7th/cmp-cmdline" },
    -- { src = "https://github.com/hrsh7th/nvim-cmp" },

    ----------------------------------------------------------------------------
    -- move
    ----------------------------------------------------------------------------

    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/benomahony/oil-git.nvim" }, -- depends on oil
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/stevearc/quicker.nvim" },
    { src = "https://github.com/ahkohd/buffer-sticks.nvim" },
    -- { src = "https://github.com/hedyhli/outline.nvim" },
    -- { src = "https://github.com/simrat39/symbols-outline.nvim" },

    ----------------------------------------------------------------------------
    -- git
    ----------------------------------------------------------------------------

    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },  -- neogit dependency
    { src = "https://github.com/sindrets/diffview.nvim" }, -- neogit dependency
    { src = "https://github.com/NeogitOrg/neogit" },

    ----------------------------------------------------------------------------
    -- color scheme
    ----------------------------------------------------------------------------

    -- { src = "https://github.com/Mofiqul/vscode.nvim" },
    {
        src = "https://github.com/rose-pine/neovim",
        name = "rose-pine"
    },
})

--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------

require("lspconfig")

-- require("glance").setup()

--------------------------------------------------------------------------------
-- moving
--------------------------------------------------------------------------------

require("mini.pick").setup()
require("oil").setup()
require("flash").setup({})
require("quicker").setup({})
require("buffer-sticks").setup({
    filter = {
        filetypes = { "help", "qf" },         -- Exclude by filetype (also: "NvimTree", "neo-tree", "Trouble")
        buftypes = { "terminal" },            -- Exclude by buftype (also: "help", "quickfix", "nofile")
        names = { ".*%.git/.*", "^/tmp/.*" }, -- Exclude buffers matching lua patterns
    },
})
-- require("outline").setup({})
-- require("symbols-outline").setup()

--------------------------------------------------------------------------------
-- git
--------------------------------------------------------------------------------

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
require("neogit").setup({})

--------------------------------------------------------------------------------
-- editing
--------------------------------------------------------------------------------

require("mini.pairs").setup({})
require("nvim-surround").setup({})
require("fastaction").setup({})
require("mini.indentscope").setup({})

--------------------------------------------------------------------------------
-- completion
--------------------------------------------------------------------------------

require("supermaven-nvim").setup({
    keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-w>",
    }
})

--------------------------------------------------------------------------------
-- ui
--------------------------------------------------------------------------------

require('mini.extra').setup()
require("auto-save").setup({})
require("mini.bufremove").setup({})
require("mini.animate").setup({})
require("mini.statusline").setup({})
require("mini.clue").setup({
    -- Register `<Leader>` as trigger
    triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
    },

    -- Add descriptions for mapping groups
    clues = {
        { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
        { mode = 'n', keys = '<Leader>f', desc = '+Files' },
        { mode = 'n', keys = '<Leader>g', desc = '+Git' },
        { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
        { mode = 'n', keys = '<Leader>p', desc = '+Php' },
        { mode = 'n', keys = '<Leader>q', desc = '+Quickfix' },
        { mode = 'n', keys = '<Leader>s', desc = '+Sessions' },
        -- { mode = 'n', keys = '<Leader>t', desc = '+Treesitter' },
    },
})
require("mini.starter").setup({})
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

require("barbecue").setup({
    theme = "default"
})
require("mason").setup({})
require("multicursor-nvim").setup({})
require("todo-comments").setup({})
