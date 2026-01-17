--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/gbprod/phpactor.nvim" },
    { src = "https://github.com/iamkarasik/sonarqube.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/Chaitanyabsprip/fastaction.nvim" },
})

require("mason").setup({})
require("fastaction").setup({})
require("sonarqube").setup({})
require("phpactor").setup({
    install = {
        path = vim.fn.stdpath("data") .. "/mason/packages/",
        branch = "master",
        bin = vim.fn.stdpath("data") .. "/mason/packages/phpactor/phpactor.phar",
        php_bin = "php",
        composer_bin = "composer",
        git_bin = "git",
        check_on_startup = "none",
    },
    lspconfig = {
        enabled = false,
        options = {},
    },
})
