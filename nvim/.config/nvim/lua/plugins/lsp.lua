--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------

vim.pack.add({

    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/phpactor/phpactor" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/Chaitanyabsprip/fastaction.nvim" },
    -- { src = "https://github.com/DNLHC/glance.nvim" },
})

require("lspconfig")
require("mason").setup({})
require("fastaction").setup({})

-- require("glance").setup()
