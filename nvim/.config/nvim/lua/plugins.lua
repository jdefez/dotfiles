vim.pack.add({
    -- ui

    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/xiyaowong/virtcolumn.nvim" },
    {
        src = "https://github.com/lukas-reineke/indent-blankline.nvim",
        name = 'ibl'
    },
    { src = "https://github.com/okuuva/auto-save.nvim" },
    { src = "https://github.com/echasnovski/mini.bufremove" },
    { src = "https://github.com/echasnovski/mini.animate" },


    -- lsp

    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/phpactor/phpactor" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/Chaitanyabsprip/fastaction.nvim" },
    -- { src = "https://github.com/DNLHC/glance.nvim" },

    -- treesitter

    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-refactor" }, -- after nvim-treesitter

    -- edit

    { src = "https://github.com/kylechui/nvim-surround" },
    { src = "https://github.com/echasnovski/mini.pairs" },

    -- git

    { src = "https://github.com/lewis6991/gitsigns.nvim" },

    { src = "https://github.com/nvim-lua/plenary.nvim" },  -- neogit dependency
    { src = "https://github.com/sindrets/diffview.nvim" }, -- neogit dependency
    { src = "https://github.com/NeogitOrg/neogit" },

    -- move

    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/stevearc/quicker.nvim" },
    { src = "https://github.com/ahkohd/buffer-sticks.nvim" },
    -- { src = "https://github.com/hedyhli/outline.nvim" },
    { src = "https://github.com/simrat39/symbols-outline.nvim" },

    -- color scheme
})

-- lsp

require("lspconfig")

-- require("glance").setup()

-- moving

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

-- git

require("gitsigns").setup({ signcolumn = true })
require("neogit").setup({})

-- editing

require("mini.pairs").setup()
require("nvim-surround").setup({})
require("fastaction").setup({})

-- ui

require("ibl").setup()
require("auto-save").setup({})
require("mini.bufremove").setup({})
require("mini.animate").setup()
