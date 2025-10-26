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
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-refactor" }, -- after nvim-treesitter

    ----------------------------------------------------------------------------
    -- edit
    ----------------------------------------------------------------------------

    { src = "https://github.com/kylechui/nvim-surround" },
    { src = "https://github.com/echasnovski/mini.pairs" },
    { src = "https://github.com/echasnovski/mini.indentscope" },

    ----------------------------------------------------------------------------
    -- completion
    ----------------------------------------------------------------------------

    { src = "https://github.com/supermaven-inc/supermaven-nvim" }, -- supertab dependency
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },

    ----------------------------------------------------------------------------
    -- move
    ----------------------------------------------------------------------------

    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/stevearc/quicker.nvim" },
    { src = "https://github.com/ahkohd/buffer-sticks.nvim" },
    -- { src = "https://github.com/hedyhli/outline.nvim" },
    { src = "https://github.com/simrat39/symbols-outline.nvim" },

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

    { src = "https://github.com/Mofiqul/vscode.nvim" },
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
require("symbols-outline").setup()

--------------------------------------------------------------------------------
-- git
--------------------------------------------------------------------------------

require("gitsigns").setup({})
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

require("supermaven-nvim").setup({})
local cmp = require('cmp')
cmp.setup({
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only
        --   confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'supermaven-nvim' },
    }, {
        { name = 'buffer' },
    })
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
        { mode = 'n', keys = '<Leader>s', desc = '+Sessions' },
    },
})
require("mini.sessions").setup({
    autoread = true,
    autowrite = true, -- default
})
require("barbecue").setup({
    theme = "default"
})

--------------------------------------------------------------------------------
-- color scheme
--------------------------------------------------------------------------------

require('vscode').setup({
    italic_comments = true,
})
